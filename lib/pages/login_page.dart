import 'package:epicBid/cubits/auth_cubit/auth_cubit.dart';
import 'package:epicBid/cubits/auth_cubit/auth_states.dart';
import 'package:epicBid/pages/register_page.dart';
import 'package:epicBid/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';
import 'forgot_password_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscured = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            SnackBarService.showSuccessMessage("Login successfully!");
            Navigator.pushNamed(context, HomePage.id);
          } else if (state is LoginFailedState) {
            SnackBarService.showErrorMessage(state.message);
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff2D5356), Color(0xff738D8F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Top Section
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/login.png',
                                      width: 220),
                                  const SizedBox(height: 12),
                                  Text(
                                    lang?.epicBid ?? '',
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                      decoration: TextDecoration.none,
                                      color: const Color(0xffEDB232),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 48,
                                    ),
                                  ),
                                  Text(
                                    lang?.eCommerceAndAuction ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Inter',
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: emailController,
                                          validator: (input) {
                                            if (input == null ||
                                                input.isEmpty) {
                                              return "please enter your email";
                                            }
                                            var regex = RegExp(
                                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                            if (!regex.hasMatch(input)) {
                                              return "invalid email";
                                            }
                                            return null;
                                          },
                                          style: const TextStyle(
                                              color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            prefixIcon: const ImageIcon(
                                              AssetImage(
                                                  "assets/icons/user.png"),
                                              color: Colors.white,
                                            ),
                                            hintText: lang?.email ?? '',
                                            hintStyle: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 0.8),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 0.8),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          controller: passwordController,
                                          obscureText: isObscured,
                                          validator: (input) {
                                            if (input == null ||
                                                input.isEmpty) {
                                              return "please enter your password";
                                            }
                                            return null;
                                          },
                                          style: const TextStyle(
                                              color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            prefixIcon: const ImageIcon(
                                              AssetImage(
                                                  "assets/icons/password.png"),
                                              color: Colors.white,
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isObscured = !isObscured;
                                                });
                                              },
                                              child: Icon(
                                                isObscured
                                                    ? Icons
                                                        .visibility_off_outlined
                                                    : Icons.visibility,
                                                color: Colors.white,
                                              ),
                                            ),
                                            hintText: lang?.password,
                                            hintStyle: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 0.8),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Bottom White Container
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 24),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ForgotPasswordPage.id);
                                    },
                                    child: Text(
                                      lang?.forgotPassword ?? '',
                                      style: const TextStyle(
                                        color: Color(0xff2D5356),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  FilledButton(
                                    style: FilledButton.styleFrom(
                                      elevation: 6,
                                      shadowColor: Colors.black,
                                      fixedSize: const Size(340, 54),
                                      backgroundColor: const Color(0xff2D5356),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthCubit>(context)
                                            .login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      lang?.login ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    lang?.or ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff2D5356),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  FilledButton(
                                    style: FilledButton.styleFrom(
                                      elevation: 6,
                                      shadowColor: Colors.black,
                                      fixedSize: const Size(340, 54),
                                      backgroundColor: const Color(0xff9BC7CA),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RegisterPage.id);
                                    },
                                    child: Text(
                                      lang?.createAnAccount ?? '',
                                      style: const TextStyle(
                                        color: Color(0xff2D5356),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
