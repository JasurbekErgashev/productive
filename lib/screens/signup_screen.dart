import 'package:flutter/material.dart';

import '../theme.dart';
import '../components/registration/social_login_button.dart';
import '../components/registration/input_decoration.dart';
import '../components/registration/registration_primary_button.dart';
import '../components/registration/or_divider.dart';
import '../services/constants.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceContentHeight = mediaQuery.size.height -
        mediaQuery.viewPadding.bottom -
        mediaQuery.viewPadding.top -
        32;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: deviceContentHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/app_icon.png'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
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
                        const SizedBox(height: 20),
                        TextFormField(
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
                            hintText: 'Password',
                            isPassword: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                              color: isObscure
                                  ? AppColors.white.withOpacity(0.6)
                                  : AppColors.blueMediumBlue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
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
                          buttonText: 'Sign Up',
                        ),
                        const SizedBox(height: 75),
                        const OrDivider(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialLoginButton(
                              tabHandler: () {},
                              imagePath: 'assets/images/facebook_logo.png',
                            ),
                            SocialLoginButton(
                              tabHandler: () {},
                              imagePath: 'assets/images/google_logo.png',
                            ),
                            SocialLoginButton(
                              tabHandler: () {},
                              imagePath: 'assets/images/apple_logo.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?   ',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.blueMediumBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
