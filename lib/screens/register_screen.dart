import 'dart:io';
import 'package:flutter/material.dart';
import 'package:job_recuter/screens/home_screen.dart';
import 'package:job_recuter/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Position',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth (YYYY-MM-DD)',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Education',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Already registered? Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
