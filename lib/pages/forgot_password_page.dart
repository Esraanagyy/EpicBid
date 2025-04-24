import 'package:epicBid/pages/login_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  static String id = 'password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: SingleChildScrollView(
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
                      begin: Alignment.bottomRight, // Gradient start point
                      end: Alignment.topLeft, // Gradient end point
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50), // Use Radius.circular
                      topRight: Radius.circular(50), // Use Radius.circular
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                      //left: 58,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 58),
                          child: Text(
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
                          padding: const EdgeInsets.only(
                            top: 20,
                            right: 24,
                            left: 58,
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
                                AssetImage("assets/icons/email.png"),
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
                              side: const BorderSide(color: Color(0xff2D5356)),
                              fixedSize: const Size(370, 60),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              backgroundColor: const Color(0xff9BC7CA),
                            ),
                            onPressed: () {},
                            child: InkWell(
                              onTap: () {},
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
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.id);
                            },
                            child: const Text(
                              "Back to Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
