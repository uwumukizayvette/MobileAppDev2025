import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // For current user and sign out
import 'package:cloud_firestore/cloud_firestore.dart'; // For fetching user data from Firestore

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the currently logged-in user inside the build method
    // This value is dynamic and fetched at runtime when the widget builds.
    final User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ), // Sign out icon
            onPressed: () {
              FirebaseAuth.instance.signOut(); // Logs the user out
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome, ${currentUser?.email ?? 'Guest'}!', // Display user's email
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Your User ID (UID): ${currentUser?.uid ?? 'N/A'}', // Display user's UID
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Use FutureBuilder to fetch user-specific data from Firestore
              // This ensures the data is loaded asynchronously and UI updates when ready.
              if (currentUser != null)
                FutureBuilder<DocumentSnapshot>(
                  // Fetch the document from 'users_data' collection using the user's UID
                  future: FirebaseFirestore.instance
                      .collection('users_data')
                      .doc(currentUser.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show loading spinner while data is being fetched
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      // Display error if fetching fails
                      return Text(
                        'Error loading user data: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      // If document doesn't exist (shouldn't happen if registration worked), notify user
                      return const Text(
                        'No additional user data found in Firestore.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      );
                    }

                    // Data exists, cast it to Map and display
                    final userData =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Column(
                      children: [
                        const Text(
                          'Additional Profile Data:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        // Display specific fields from the Firestore document
                        _buildDataRow(
                          context,
                          'Username:',
                          userData['username'] ?? 'Not set',
                        ),
                        _buildDataRow(
                          context,
                          'Email (from DB):',
                          userData['email'] ?? 'Not set',
                        ),
                        _buildDataRow(
                          context,
                          'Content:',
                          userData['content'] ?? 'No content',
                        ),
                        // Add more fields here if you add them to your Firestore document
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Example: Navigate to a profile editing screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Edit profile functionality will go here!',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Profile'),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a consistent row for data display
  Widget _buildDataRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          Expanded(
            // Use Expanded to prevent text overflow
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis, // Truncate long text
            ),
          ),
        ],
      ),
    );
  }
}
