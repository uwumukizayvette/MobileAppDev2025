
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  String _firestoreContent = 'Loading...';
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _fetchContent();
  }

  Future _fetchContent() async {
    if (currentUser == null) return;
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users_data')
          .doc(currentUser!.uid)
          .get();

      if (docSnapshot.exists) {
        setState(() {
          _firestoreContent = docSnapshot.data()?['content'] ?? 'No content found.';
        });
      } else {
        setState(() {
          _firestoreContent = 'No content available for this user.';
        });
      }
    } catch (e) {
      setState(() {
        _firestoreContent = 'Error loading content.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(_firestoreContent, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
                            