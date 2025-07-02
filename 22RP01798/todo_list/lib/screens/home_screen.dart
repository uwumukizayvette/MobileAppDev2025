import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';  // for kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'task_form_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  bool _isEditingProfile = false;
  late TextEditingController nameController;
  late TextEditingController emailController;
  User? currentUser;
  File? _pickedImageFile;
  String? _uploadedImageUrl;
  bool _isUploadingImage = false;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    nameController = TextEditingController(text: currentUser?.displayName ?? '');
    emailController = TextEditingController(text: currentUser?.email ?? '');
    _uploadedImageUrl = currentUser?.photoURL;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      currentUser = FirebaseAuth.instance.currentUser;
      if (index == 2 && currentUser != null) {
        nameController.text = currentUser!.displayName ?? '';
        emailController.text = currentUser!.email ?? '';
        _uploadedImageUrl = currentUser!.photoURL;
        _isEditingProfile = false;
        _pickedImageFile = null;
      }
    });
  }

  Future<void> toggleTask(String taskId, bool currentStatus) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(taskId)
        .update({'completed': !currentStatus});
  }

  Future<void> _addOrEditTask({DocumentSnapshot? task}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskFormScreen(
          initialTitle: task?.get('title'),
          initialDate: task != null ? DateTime.tryParse(task.get('date')) : null,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final title = result['task'] as String;
      final date = (result['date'] as DateTime).toIso8601String();

      if (task == null) {
        // Add userId when adding new task
        await FirebaseFirestore.instance.collection('tasks').add({
          'title': title,
          'date': date,
          'completed': false,
          'userId': currentUser!.uid, // <-- Add this
        });
      } else {
        await FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
          'title': title,
          'date': date,
          // Keep userId untouched
        });
      }
    }
  }

  Future<void> _deleteTask(String taskId) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
  }

  // Stream that groups current user's tasks by date safely
  Stream<Map<String, List<QueryDocumentSnapshot>>> getTasksGroupedByDate() {
    if (currentUser == null) {
      return Stream.value({}); // Empty map if no user
    }

    return FirebaseFirestore.instance
        .collection('tasks')
        .where('userId', isEqualTo: currentUser!.uid)  // Filter by current user
        .orderBy('date') // Requires composite index with userId
        .snapshots()
        .map((snapshot) {
      final grouped = <String, List<QueryDocumentSnapshot>>{};
      for (var doc in snapshot.docs) {
        try {
          final data = doc.data();
          if (!data.containsKey('date')) continue;
          final dateString = doc['date'] as String?;
          if (dateString == null || dateString.length < 10) continue;

          final date = dateString.substring(0, 10);
          grouped.putIfAbsent(date, () => []).add(doc);
        } catch (e) {
          // Ignore any problematic docs
          print('Error processing task doc ${doc.id}: $e');
          continue;
        }
      }
      return grouped;
    });
  }

  Future<Map<String, int>> getTaskStats() async {
    if (currentUser == null) {
      return {'total': 0, 'completed': 0, 'pending': 0};
    }

    final snapshot = await FirebaseFirestore.instance
        .collection('tasks')
        .where('userId', isEqualTo: currentUser!.uid)
        .get();

    final total = snapshot.docs.length;
    final completed = snapshot.docs.where((doc) {
      try {
        return doc['completed'] == true;
      } catch (_) {
        return false;
      }
    }).length;

    return {
      'total': total,
      'completed': completed,
      'pending': total - completed,
    };
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (picked != null) {
      setState(() {
        _pickedImageFile = File(picked.path);
      });
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      if (kIsWeb) {
        throw UnsupportedError("Image upload using File is not supported on web.");
      }
      final storageRef = FirebaseStorage.instance.ref().child('profile_pictures').child('${currentUser!.uid}.jpg');
      await storageRef.putFile(imageFile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image upload failed: $e')));
      return null;
    }
  }

  Future<void> _saveProfile() async {
    setState(() {
      _isUploadingImage = true;
    });

    try {
      String? photoUrlToUpdate = _uploadedImageUrl;

      if (_pickedImageFile != null) {
        final uploadedUrl = await _uploadImage(_pickedImageFile!);
        if (uploadedUrl != null) {
          photoUrlToUpdate = uploadedUrl;
        }
      }

      await currentUser!.updateDisplayName(nameController.text.trim());
      if (currentUser!.email != emailController.text.trim()) {
        await currentUser!.updateEmail(emailController.text.trim());
      }
      await currentUser!.updatePhotoURL(photoUrlToUpdate);
      await currentUser!.reload();
      currentUser = FirebaseAuth.instance.currentUser;

      setState(() {
        _isEditingProfile = false;
        _pickedImageFile = null;
        _uploadedImageUrl = currentUser!.photoURL;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    } finally {
      setState(() {
        _isUploadingImage = false;
      });
    }
  }

  Future<void> _removeProfilePicture() async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('profile_pictures').child('${currentUser!.uid}.jpg');
      await storageRef.delete();

      await currentUser!.updatePhotoURL(null);
      await currentUser!.reload();
      currentUser = FirebaseAuth.instance.currentUser;

      setState(() {
        _uploadedImageUrl = null;
        _pickedImageFile = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile picture removed')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove profile picture: $e')),
      );
    }
  }

  Widget _buildProfilePicture(double radius) {
    if (_pickedImageFile != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(_pickedImageFile!),
      );
    } else if (_uploadedImageUrl != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(_uploadedImageUrl!),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('assets/default_avatar.png'),
      );
    }
  }

  Widget buildHomeTab() {
    return FutureBuilder<Map<String, int>>(
      future: getTaskStats(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final stats = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, ${currentUser?.displayName ?? 'User'}!",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.green[50],
                child: ListTile(
                  title: Text("Total Tasks: ${stats['total']}"),
                  subtitle: Text("Completed: ${stats['completed']} | Pending: ${stats['pending']}"),
                  trailing: const Icon(Icons.task_alt),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _addOrEditTask(),
                icon: const Icon(Icons.add),
                label: const Text("Quick Add Task"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildProfileTab() {
    if (currentUser == null) {
      return const Center(child: Text('No user is currently logged in.'));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfilePicture(50),
            const SizedBox(height: 12),

            if (_isEditingProfile)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload New Picture'),
                  ),
                  const SizedBox(width: 10),
                  if (_uploadedImageUrl != null || _pickedImageFile != null)
                    TextButton.icon(
                      onPressed: _removeProfilePicture,
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                      label: const Text('Remove Picture', style: TextStyle(color: Colors.red)),
                    ),
                ],
              ),

            const SizedBox(height: 20),
            _isEditingProfile
                ? TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
                  )
                : Text(currentUser!.displayName ?? 'No Name',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _isEditingProfile
                ? TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                  )
                : Text(currentUser!.email ?? 'No Email',
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            _isEditingProfile
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _isUploadingImage ? null : _saveProfile,
                        icon: _isUploadingImage
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.save),
                        label: const Text('Save'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          foregroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: _isUploadingImage
                            ? null
                            : () {
                                nameController.text = currentUser!.displayName ?? '';
                                emailController.text = currentUser!.email ?? '';
                                _pickedImageFile = null;
                                setState(() => _isEditingProfile = false);
                              },
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  )
                : ElevatedButton.icon(
                    onPressed: () => setState(() => _isEditingProfile = true),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                    ),
                  ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTasksTab() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              onPressed: () => _addOrEditTask(),
              icon: const Icon(Icons.add),
              label: const Text("Add new"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: StreamBuilder<Map<String, List<QueryDocumentSnapshot>>>(
              stream: getTasksGroupedByDate(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Firestore error: ${snapshot.error}');
                  return Center(child: Text('Error loading tasks: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final tasksByDate = snapshot.data!;
                if (tasksByDate.isEmpty) {
                  return const Center(child: Text('No tasks found.'));
                }

                return ListView(
                  children: tasksByDate.entries.map((entry) {
                    final date = entry.key;
                    final taskList = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          _formatDate(date),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...taskList.map((doc) {
                          final taskId = doc.id;
                          final title = doc['title'] ?? 'Untitled';
                          final isDone = (doc.data() as Map<String, dynamic>).containsKey('completed')
                              ? doc['completed'] == true
                              : false;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  value: isDone,
                                  onChanged: (_) => toggleTask(taskId, isDone),
                                  activeColor: Colors.green[700],
                                ),
                                title: Text(
                                  title,
                                  style: TextStyle(
                                    decoration: isDone ? TextDecoration.lineThrough : null,
                                    color: isDone ? Colors.grey : Colors.black,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: Colors.grey),
                                      onPressed: () => _addOrEditTask(task: doc),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      onPressed: () => _deleteTask(taskId),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return "${date.day.toString().padLeft(2, '0')}/"
          "${date.month.toString().padLeft(2, '0')}/"
          "${date.year}";
    } catch (e) {
      return isoDate; // fallback if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (_selectedIndex == 0) {
      currentScreen = buildHomeTab();
    } else if (_selectedIndex == 2) {
      currentScreen = buildProfileTab();
    } else {
      currentScreen = buildTasksTab();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text("Task List"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          onSelected: (value) {
            switch (value) {
              case 'Home':
                _onItemTapped(0);
                break;
              case 'Tasks':
                _onItemTapped(1);
                break;
              case 'Profile':
                _onItemTapped(2);
                break;
              case 'Logout':
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'Home', child: Text('Home')),
            PopupMenuItem(value: 'Tasks', child: Text('Tasks')),
            PopupMenuItem(value: 'Profile', child: Text('Profile')),
            PopupMenuItem(value: 'Logout', child: Text('Logout')),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'Profile':
                    _onItemTapped(2);
                    break;
                  case 'Logout':
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                    break;
                }
              },
              icon: _buildProfilePicture(18),
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'Profile', child: Text('Profile')),
                PopupMenuItem(value: 'Logout', child: Text('Logout')),
              ],
            ),
          ),
        ],
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
