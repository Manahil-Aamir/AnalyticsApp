import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visionproject/shared/helpers/validators.dart';
import 'package:visionproject/shared/widgets/customformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _agreedToTerms = false;
  bool _showCheckboxError = false;

  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    setState(() {
      _showCheckboxError = !_agreedToTerms;
    });

    if (_formKey.currentState?.validate() ?? false) {
      // Perform registration logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App Logo
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const FlutterLogo(size: 100.0),
              ),
              // Name Input
              CustomFormField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                validator: Validators.validateName,
              ),
              20.verticalSpace,
              // Email Input
              CustomFormField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),
              20.verticalSpace,
              // Password Input
              CustomFormField(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscure: true,
                validator: Validators.validatePassword,
              ),
              20.verticalSpace,
              // Confirm Password Input
              CustomFormField(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                obscure: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
              ),
              // Terms Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                        _showCheckboxError = !_agreedToTerms;
                      });
                    },
                  ),
                  const Text('I agree to the Terms and Conditions'),
                ],
              ),
              if (_showCheckboxError)
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                  child: Text(
                    'You must agree to the terms and conditions.',
                    style: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                  ),
                ),
              // Register Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _agreedToTerms
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Register'),
              ),
              // Login Link
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
