import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_13_totally03_lec_firebase/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext con, AsyncSnapshot<User?> user) {
          if (!user.hasData) {
            return const LoginPage();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Firebase App - Home'),
                actions: [
                  IconButton(
                    onPressed: () async => await FirebaseAuth.instance
                        .signOut()
                        .then((_) => Navigator.pushNamed(context, '/login')),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              body: const Center(
                child: Text('Successfully logged in!'),
              ),
            );
          }
        });
  }
}
