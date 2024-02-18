import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage = '';
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailField(),
              const SizedBox(height: 16.0),
              _buildPasswordField(),
              const SizedBox(height: 16.0),
              _buildErrorText(),
              _buildSubmitButton(),
              const SizedBox(height: 16.0),
              _buildSwitchButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email address',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      validator: (value) => EmailValidator.validate(value ?? '') ? null : 'Invalid email format',
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      validator: (value) => value!.length >= 8 ? null : 'Password must be at least 8 characters',
    );
  }

  Widget _buildErrorText() {
    return Text(
      errorMessage ?? '',
      style: const TextStyle(color: Colors.redAccent),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => _submitForm(),
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _buildSwitchButton() {
    return TextButton(
      onPressed: () => setState(() => isLogin = !isLogin),
      child: Text(isLogin ? 'Register instead' : 'Login Instead'),
    );
  }

  void _submitForm() async {
  if (_formKey.currentState!.validate()) {
    try {
      if (isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    } catch (e) {
      // Handle other exceptions here
      print('Unexpected error: $e');
    }
  }
}

}
