import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:productive/app/ui/screens/register/widgets/input_decoration.dart';
import 'package:productive/app/ui/screens/register/widgets/or_divider.dart';
import 'package:productive/app/ui/screens/register/widgets/registration_primary_button.dart';
import 'package:productive/app/ui/screens/register/widgets/social_login_button.dart';
import 'package:productive/shared/constants.dart';
import 'package:productive/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email is required';
                            } else if (!emailRegExp.hasMatch(value)) {
                              return 'Make sure to use valid email address';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password is required';
                            } else if (value.trim().length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          tabHandler: signup,
                          buttonChild: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
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
                          onTap: () => context.go('/login'),
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

  Future<void> signup() async {
    if (_formKey.currentState!.validate()) {
      // TODO: Firebase register will be implemented later using Bloc
      setState(() => _isLoading = true);
      // try {
      //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: _emailController.text,
      //     password: _passwordController.text,
      //   );
      // } on FirebaseAuthException catch (error) {
      //   showTopSnackBar(
      //     Overlay.of(context),
      //     dismissDirection: [DismissDirection.up],
      //     CustomSnackBar.error(
      //       message: error.message!,
      //       textAlign: TextAlign.left,
      //     ),
      //   );
      // } finally {
      //   setState(() => _isLoading = false);
      // }
    }
  }
}
