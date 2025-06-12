import 'package:epicBid/cubits/auth_cubit/auth_cubit.dart';
import 'package:epicBid/cubits/auth_cubit/auth_states.dart';
import 'package:epicBid/pages/login_page.dart';
import 'package:epicBid/pages/verify_code_page.dart';
import 'package:epicBid/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  static String id = 'password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double topPadding =
        size.height * 0.08; // Increased for space above image
    final double horizontalPadding = size.width * 0.1; // 10% of screen width
    final double buttonWidth = size.width * 0.8; // 80% of screen width

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            SnackBarService.showSuccessMessage('check your email!');
            Navigator.pushNamed(context, VerifyCodePage.id);
          } else if (state is PasswordFailedState) {
            SnackBarService.showErrorMessage(state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: topPadding),
                            const ImageIcon(
                              AssetImage("assets/icons/password_page.png"),
                              color: Color(0xff2D5356),
                              size: 100,
                            ),
                            const Text(
                              "Forgot \n Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff2D5356),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 43,
                              ),
                            ),
                            const Text(
                              "No Worries , We Will Send You\nreset instructions",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff2D5356),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: size.height *
                                        0.08), // Increased for space above container
                                child: Container(
                                  width: double.infinity, // Full page width
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff2D5356),
                                        Color(0xff738D8F),
                                      ],
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height *
                                            0.02), // Reduced for smaller height
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: horizontalPadding,
                                            top: 40,
                                          ),
                                          child: const Text(
                                            "Email",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 15,
                                            right: horizontalPadding,
                                            left: horizontalPadding,
                                          ),
                                          child: TextFormField(
                                            controller: emailController,
                                            validator: (input) {
                                              if (emailController
                                                  .text.isEmpty) {
                                                return "please enter your email";
                                              }
                                              var regex = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                              if (!regex.hasMatch(
                                                  emailController.text)) {
                                                return "invalid email";
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              prefixIcon: const ImageIcon(
                                                AssetImage(
                                                    "assets/icons/email.png"),
                                                color: Colors.white,
                                              ),
                                              hintText: "Email Address",
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
                                                  width: 0.8,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 0.8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 15,
                                            right: horizontalPadding,
                                            bottom: 15,
                                            left: horizontalPadding,
                                          ),
                                          child: FilledButton(
                                            style: FilledButton.styleFrom(
                                              elevation: 6,
                                              shadowColor: Colors.black,
                                              side: const BorderSide(
                                                  color: Color(0xff2D5356)),
                                              minimumSize: Size(buttonWidth,
                                                  size.height * 0.07),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                              backgroundColor:
                                                  const Color(0xff9BC7CA),
                                            ),
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                BlocProvider.of<AuthCubit>(
                                                        context)
                                                    .forgotPassword(
                                                  email: emailController.text,
                                                );
                                              }
                                            },
                                            child: const Text(
                                              "Send Code",
                                              style: TextStyle(
                                                color: Color(0xff2D5356),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, LoginPage.id);
                                            },
                                            child: const Text(
                                              "Back to Login",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Inter',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: size.height *
                                                0.015), // Reduced bottom padding
                                      ],
                                    ),
                                  ),
                                ),
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
