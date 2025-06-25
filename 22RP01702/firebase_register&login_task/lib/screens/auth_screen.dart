import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State createState() => _AuthScreenState();
}

class _AuthScreenState extends State {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isLogin = true;
  bool _isLoading = false;

  void _submitAuthForm() async {
    print('_submitAuthForm called, _isLogin: $_isLogin');
    
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      print('Form validation failed');
      return;
    }

    _formKey.currentState!.save();
    print('Form saved, email: $_email, password length: ${_password.length}');
    
    setState(() { _isLoading = true; });

    try {
      if (_isLogin) {
        print('Attempting to sign in...');
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email, password: _password);
        print('Sign in successful');
      } else {
        print('Attempting to create user...');
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password);
        print('User created successfully: ${userCredential.user?.uid}');
        
        print('Saving user data to Firestore...');
        await FirebaseFirestore.instance
            .collection('users_data')
            .doc(userCredential.user!.uid)
            .set({
              'email': _email,
              'content': 'A personalized welcome message!',
            });
        print('User data saved to Firestore');
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} - ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message ?? 'Authentication failed.'}'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      print('General exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unexpected error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() { _isLoading = false; });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email address'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value ?? '';
                    },
                  ),
                  TextFormField(
                    key: const ValueKey('password'),
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value ?? '';
                    },
                  ),
                  const SizedBox(height: 12),
                  if (_isLoading) const CircularProgressIndicator(),
                  if (!_isLoading)
                    ElevatedButton(
                      onPressed: _submitAuthForm,
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                    ),
                  if (!_isLoading)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
                            