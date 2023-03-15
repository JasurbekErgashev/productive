import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:productive/app/ui/screens/register/new_password.dart';
import 'package:productive/app/ui/widgets/primary_button.dart';
import 'package:productive/theme.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email Verification',
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
                  children: [
                    const Text(
                      'Please enter the 4 digital code that send to your email address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Pinput(
                      cursor: Container(
                        height: 20,
                        width: 1,
                        color: AppColors.white,
                      ),
                      defaultPinTheme: PinTheme(
                        height: 55,
                        width: 50,
                        textStyle: const TextStyle(color: AppColors.white),
                        decoration: BoxDecoration(
                          border: Border(
                            top: customBorderSide(0.1),
                            bottom: customBorderSide(0.1),
                            left: customBorderSide(0.1),
                            right: customBorderSide(0.1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.blueDarkBlue2,
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        height: 55,
                        width: 50,
                        textStyle: const TextStyle(color: AppColors.white),
                        decoration: BoxDecoration(
                          border: Border(
                            top: customBorderSide(1),
                            bottom: customBorderSide(1),
                            left: customBorderSide(1),
                            right: customBorderSide(1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.blueDarkBlue2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "If you don't receive code.",
                          style: TextStyle(color: AppColors.white),
                        ),
                        Text(
                          ' Resend',
                          style: TextStyle(color: AppColors.blueMediumBlue),
                        ),
                      ],
                    ),
                  ],
                ),
                PrimaryButton(
                  tabHandler: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const CreateNewPassword(),
                        ),
                      );
                    }
                  },
                  buttonChild: const Text(
                    'Verify',
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

BorderSide customBorderSide(double opacity) {
  return BorderSide(
    color: const Color(0xFF006EE9).withOpacity(opacity),
  );
}
