import 'package:flutter/material.dart';
import 'package:job_recuter/screens/home_screen.dart';
import 'package:job_recuter/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  // Method to sign in with email and password
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        // Centering the fields on the screen
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email text field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Password text field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24),
                  // Sign in button
                  ElevatedButton(
                    onPressed: () => signInWithEmailAndPassword(context),
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 16),
                  // Link to navigate to the register screen
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Not registered yet? Register now'),
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
