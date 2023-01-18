import 'package:flutter/material.dart';

import '../theme.dart';
import '../components/registration/input_decoration.dart';
import '../components/registration/registration_primary_button.dart';
import './home_screen.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isMatched = false;

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Create New Password',
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
        child: SingleChildScrollView(
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          } else if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        obscureText: isObscure,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          letterSpacing: 3,
                        ),
                        cursorColor: AppColors.blueMediumBlue,
                        decoration: customInputDecoration(
                          hintText: 'Enter new password',
                          isPassword: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            if (value == _passwordController.text) {
                              isMatched = true;
                            } else {
                              isMatched = false;
                            }
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          } else if (value != _passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        obscureText: isObscure,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          letterSpacing: 3,
                        ),
                        cursorColor: AppColors.blueMediumBlue,
                        decoration: customInputDecoration(
                          hintText: 'Confirm password',
                          isPassword: true,
                          suffixIcon: Icon(
                            Icons.check_circle_rounded,
                            color: isMatched
                                ? Colors.green
                                : AppColors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CheckboxListTile(
                        value: !isObscure,
                        onChanged: (value) {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        title: Text(
                          'Show Password',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
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
                    buttonText: 'Save',
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
