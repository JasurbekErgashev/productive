import 'package:flutter/material.dart';

import '../theme.dart';
import '../services/constants.dart';
import '../components/registration/input_decoration.dart';
import '../components/registration/registration_primary_button.dart';
import 'home_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.white.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(75),
                  ),
                  height: 130,
                  width: 130,
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.white,
                    size: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        } else if (!emailRegExp.hasMatch(value)) {
                          return 'Make sure to use valid email address';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      cursorColor: AppColors.blueMediumBlue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: customInputDecoration(hintText: 'Email'),
                    ),
                  ],
                ),
                RegistrationPrimaryButton(
                  tabHandler: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  buttonText: 'Recover password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
