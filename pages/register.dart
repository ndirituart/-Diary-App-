import 'package:flutter/material.dart';
import 'package:project_idea/constants/textfield.dart';
import 'package:project_idea/pages/dashboard.dart';

// ignore: unused_import
import 'package:project_idea/pages/login.dart';
import 'package:project_idea/pages/main.dart';

void main() {
  runApp(const MyApp());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registration Page'),
        ),
        body: const RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  late String _username, _password, _confirmPassword;
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 132, 189),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            // logo
            const SquareTile(imagePath: 'assets/images/logoyangu.png'),
            const SizedBox(height: 50),
            // welcome back, you've been missed!
            const Text(
              'Register!',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
            ),
            const SizedBox(height: 10),
            // password textfield
            MyTextField(
              controller: passwordController,
              hintMessage: 'Password',
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) => _password = value!,
            ),
            MyTextField(
              controller: passwordController,
              hintMessage: 'Confirm Password',
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a confirm password';
                }
                if (value != _password) {
                  return 'Passwords do not match';
                }

                return null;
              },
              onSaved: (value) {
                if (value == passwordController.text) {
                  // Perform registration if confirm password matches password
                  registerUser();
                }
              },
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Perform registration
                  registerUser(); // Implement this function to register the user

                  // Navigate to the dashboard only if registration is successful
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDashboard()),
                  );
                }
              },
              child: const Text('REGISTER'),
            )
          ],
        ),
      ),
    );
  }
}
