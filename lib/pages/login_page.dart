import 'package:epicBid/pages/forgot_password_page.dart';
import 'package:epicBid/pages/home_page.dart';
import 'package:epicBid/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff2D5356),
            Color(0xff738D8F),
          ],
          begin: Alignment.topLeft, // Gradient start point
          end: Alignment.bottomRight, // Gradient end point
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 72.87),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login.png',
                  width: 300,
                ),
                Text(
                  "EpicBid",
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
                    fontSize: 56,
                  ),
                ),
                const Text("E-commerce & Auction",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Inter',
                      decoration: TextDecoration.none,
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    right: 35,
                    left: 35,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "please enter your email";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
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
                        AssetImage("assets/icons/user.png"),
                        color: Colors.white,
                      ),
                      hintText: "Email or phone",
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
                        borderRadius: BorderRadius.circular(
                            32), // Same radius as focusedBorder
                        borderSide: const BorderSide(
                          color: Colors
                              .white, // Define a color for the enabled state
                          width: 0.8, // Same width as focusedBorder
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                    right: 35,
                    left: 35,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "please Enter Your Password";
                      }
                      return null;
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    obscureText: isObscured,
                    decoration: InputDecoration(
                      prefixIcon: const ImageIcon(
                        AssetImage("assets/icons/password.png"),
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
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "Password",
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
                        borderRadius: BorderRadius.circular(
                            32), // Same radius as focusedBorder
                        borderSide: const BorderSide(
                          color: Colors
                              .white, // Define a color for the enabled state
                          width: 0.8, // Same width as focusedBorder
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    height: 255,
                    width: 440,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50), // Use Radius.circular
                        topRight: Radius.circular(50), // Use Radius.circular
                      ),
                    ), // Fixed width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgotPasswordPage.id);
                            },
                            child: const Text(
                              textAlign: TextAlign.center,
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xff2D5356),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 50, left: 50),
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              elevation: 6,
                              shadowColor: Colors.black,
                              side: const BorderSide(color: Colors.white),
                              fixedSize: const Size(340, 54),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              backgroundColor: const Color(0xff2D5356),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, HomePage.id);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          textAlign: TextAlign.center,
                          "or",
                          style: TextStyle(
                            color: Color(0xff2D5356),
                            fontFamily: 'Inter',
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 50, left: 50),
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              elevation: 6,
                              shadowColor: Colors.black,
                              side: const BorderSide(color: Color(0xff2D5356)),
                              fixedSize: const Size(340, 54),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              backgroundColor: const Color(0xff9BC7CA),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: const Text(
                              "Create an account",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
