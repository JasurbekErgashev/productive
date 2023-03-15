import 'package:flutter/material.dart';
import 'package:productive/app/ui/screens/register/email_verification.dart';
import 'package:productive/app/ui/widgets/input_decoration.dart';
import 'package:productive/app/ui/widgets/primary_button.dart';
import 'package:productive/shared/constants.dart';
import 'package:productive/theme.dart';

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
                  child: const Icon(
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
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      cursorColor: AppColors.blueMediumBlue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: customInputDecoration(hintText: 'Email'),
                    ),
                  ],
                ),
                PrimaryButton(
                  tabHandler: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EmailVerificationScreen(),
                        ),
                      );
                    }
                  },
                  buttonChild: const Text(
                    'Recover password',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
