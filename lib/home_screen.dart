import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                 
                    children: [
                      const Text('Home Screen'),
                      ElevatedButton(
                        onPressed: () {
              FirebaseAuth.instance.signOut();
              
                        },
                        child: const Text('Sign Out'),
                      ),
                    ],
                  ),
            )));
  }
}
