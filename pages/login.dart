import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:project_idea/constants/materialbutton.dart';
import 'package:project_idea/constants/squaretile.dart';
// ignore: unused_import
import 'package:project_idea/constants/textfield.dart';
import 'package:project_idea/pages/dashboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 132, 189),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 50),

            // logo
            const SquareTile(imagePath: 'assets/images/logoyangu.png'),

            const SizedBox(height: 50),

            // welcome back, you've been missed!
            const Text(
              'Welcome!',
              style: TextStyle(
                color: Color.fromARGB(255, 53, 1, 58),
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // username textfield
            MyTextField(
              controller: usernameController,
              hintMessage: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password textfield
            MyTextField(
              controller: passwordController,
              hintMessage: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // forgot password?
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromARGB(255, 98, 7, 243)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // sign in button
            ElevatedButton(
              onPressed: () {
                // Navigate to the home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Sign in"),
            ),

            // or continue with
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(100, 231, 5, 5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Color.fromARGB(255, 196, 2, 2)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 161, 5, 5),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // google + apple sign in buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google button
                SquareTile(imagePath: 'assets/images/google.png'),

                SizedBox(width: 25),

                // apple button
                SquareTile(imagePath: 'assets/images/apple.png')
              ],
            ),

            const SizedBox(height: 50),

            // not a member? register now
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
                ),
                SizedBox(width: 4),
                Text(
                  'Register now',
                  style: TextStyle(
                    color: Color.fromARGB(255, 12, 12, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // how to replace this with the homepage file
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diary"),
      ),
      body: Container(
        color: Colors.pink[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome, how was your day",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the dashboard within homepage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDashboard()),
                );
              },
              child: const Text("Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
