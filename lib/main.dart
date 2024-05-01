import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:join_your_group/authentication/login_screen.dart';
import 'package:join_your_group/firebase_options.dart';
import 'package:join_your_group/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if(snapshot.hasData){
          return const HomeScreen();
        }
        else if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
        else{
        return  const LoginScreen();
        }
        },),
    );
  }
}





