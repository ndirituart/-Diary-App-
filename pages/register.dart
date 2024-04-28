//A registration page o cater for new memebrs who it is their first time to try the app
// ignore_for_file: unused_import
import 'package:project_idea/pages/login.dart';
import 'package:flutter/material.dart';
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

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  late String _username, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Username'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
            onSaved: (value) => _username = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Confirm Password'),
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
            onSaved: (value) => _confirmPassword = value!,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Perform registration
              }
            },
            child: const Text('REGISTER'),
          ),
        ],
      ),
    );
  }
}
