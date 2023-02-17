import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:productive/app/ui/screens/register/widgets/input_decoration.dart';
import 'package:productive/app/ui/screens/register/widgets/or_divider.dart';
import 'package:productive/app/ui/screens/register/widgets/registration_primary_button.dart';
import 'package:productive/app/ui/screens/register/widgets/social_login_button.dart';
import 'package:productive/shared/constants.dart';
import 'package:productive/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
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
                          obscureText: _isObscure,
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
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                              color: _isObscure
                                  ? AppColors.white.withOpacity(0.6)
                                  : AppColors.blueMediumBlue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => context.go('login/forgotPassword'),
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: AppColors.blueMediumBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        RegistrationPrimaryButton(
                          tabHandler: login,
                          buttonChild: const Text(
                            'Login',
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
                          "Don't have an account?   ",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go('/register'),
                          child: Text(
                            'Sign up',
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

  Future<void> login() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    // TODO: Firebase login will be implemented later using Bloc
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(color: Colors.white),
    //   ),
    // );
    // try {
    //   await Provider.of<AuthProvider>(
    //     context,
    //     listen: false,
    //   ).login(
    //     email: _emailController.text,
    //     password: _passwordController.text,
    //   );
    //   if (mounted) return;
    // } on FirebaseAuthException catch (error) {
    //   showTopSnackBar(
    //     Overlay.of(context),
    //     dismissDirection: [DismissDirection.up],
    //     CustomSnackBar.error(
    //       message: error.message!,
    //       textAlign: TextAlign.left,
    //     ),
    //   );
    // }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
