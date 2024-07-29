import 'package:flutter/material.dart';
import 'package:login_demo/car_rental.dart';
import 'package:login_demo/data/firebase_service/firebase_auth.dart';
import 'package:login_demo/loginform.dart';

class Signup extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = 
  get; address () => null;
  
  get get => null;

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Display a success message with custom color
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'you are logged in',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Color.fromARGB(255, 24, 3, 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: const Color.fromARGB(255, 255, 68, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
             ElevatedButton(
  onPressed: () async {
    await Authentication().Signup(
      email: _emailController.text,
      password: _passwordController.text, address: '',
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CarRentalApp(address)),
    );
  },
  child: const Text('Signup'),
),
const SizedBox(height: 20),
TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginForm()),
    );
  },
  child: const Text('Have an account? log in'),
)

          ),
        ),
      ),
    );
  }
}





class _TexteditingController {
  get ()  => null;
}
