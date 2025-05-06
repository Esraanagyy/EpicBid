import 'package:epicBid/pages/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_states.dart';
import '../services/snack_bar_service.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});
  static String id = 'code';

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final codeController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is VerifySuccessState) {
            print("Show success message");
            SnackBarService.showSuccessMessage(
                'Password is Reset Successfully!');
            Navigator.pushNamed(context, ResetPasswordPage.id);
          } else if (state is VerifyFailedState) {
            print('error');
            SnackBarService.showErrorMessage('Something Went Wrong!');
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.only(top: 170),
                        child: Container(
                          height: 430,
                          width: 440,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff2D5356),
                                Color(0xff738D8F),
                              ],
                              begin:
                                  Alignment.bottomRight, // Gradient start point
                              end: Alignment.topLeft, // Gradient end point
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(50), // Use Radius.circular
                              topRight:
                                  Radius.circular(50), // Use Radius.circular
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 50,
                              //left: 58,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 58),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    right: 24,
                                    left: 58,
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (input) {
                                      if (emailController.text.isEmpty) {
                                        return "please enter your email";
                                      }
                                      var regex = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                      if (!regex
                                          .hasMatch(emailController.text)) {
                                        return "invalid email";
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Color(
                                          0xff979797,
                                        ),
                                      ),
                                      hintText: "Email Address",
                                      hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 0.8,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 0.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 58),
                                  child: Text(
                                    "Reset Code",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    right: 24,
                                    left: 58,
                                  ),
                                  child: TextFormField(
                                    controller: codeController,
                                    validator: (input) {
                                      if (codeController.text.isEmpty) {
                                        return "please enter your reset code";
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.password,
                                        color: Color(
                                          0xff979797,
                                        ),
                                      ),
                                      hintText: "Reset Code",
                                      hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 0.8,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 0.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    right: 24,
                                    bottom: 50,
                                    left: 58,
                                  ),
                                  child: FilledButton(
                                    style: FilledButton.styleFrom(
                                      elevation: 6,
                                      shadowColor: Colors.black,
                                      side: const BorderSide(
                                          color: Color(0xff2D5356)),
                                      fixedSize: const Size(370, 60),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      backgroundColor: const Color(0xff9BC7CA),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthCubit>(context)
                                            .verifyCode(
                                          email: emailController.text,
                                          code: int.parse(codeController.text),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      "Reset Password",
                                      style: TextStyle(
                                        color: Color(0xff2D5356),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
