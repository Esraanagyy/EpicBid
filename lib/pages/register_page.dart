import 'package:epicBid/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 450,
              height: 329,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff2D5356),
                    Color(0xff738D8F),
                  ],
                  begin: Alignment.topLeft, // Gradient start point
                  end: Alignment.bottomRight, // Gradient end point
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 80, left: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Now!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        fontSize: 34,
                      ),
                    ),
                    Text(
                      "Create \n Your \n Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 65,
                bottom: 16,
                right: 35,
                left: 35,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please Enter Your Name";
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
                    color: Color(0xff4C4C4C),
                  ),
                  hintText: "Full Name",
                  hintStyle: const TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
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
                    color: Color(0xff4C4C4C),
                  ),
                  hintText: "Email Address",
                  hintStyle: const TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
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
                    return "please Enter Your password";
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: isObscured,
                cursorColor: Colors.white,
                decoration: InputDecoration(
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
                      color: const Color(0xff4C4C4C),
                    ),
                  ),
                  prefixIcon: const ImageIcon(
                    AssetImage("assets/icons/password.png"),
                    color: Color(0xff4C4C4C),
                  ),
                  hintText: "Password",
                  hintStyle: const TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
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
                    return "please retype Your Password";
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
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
                      color: const Color(0xff4C4C4C),
                    ),
                  ),
                  prefixIcon: const ImageIcon(
                    AssetImage("assets/icons/password.png"),
                    color: Color(0xff4C4C4C),
                  ),
                  hintText: "Retype Password",
                  hintStyle: const TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Color(0xff2D5356),
                      width: 0.8,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 40,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_box_outline_blank,
                    size: 15,
                  ),
                  Text(
                    "  I agree to the",
                    style: TextStyle(
                      color: Color(0xff468286),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    " Terms & conditions",
                    style: TextStyle(
                      color: Color(0xff2D5356),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 35, left: 35),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  elevation: 6,
                  shadowColor: Colors.black,
                  side: const BorderSide(color: Colors.white),
                  fixedSize: const Size(340, 54),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: const Color(0xff2D5356),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 65,
              ),
              child: Row(
                children: [
                  const Text(
                    "have an account?",
                    style: TextStyle(
                      color: Color(0xff468286),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: const Text(
                      "  Sign In",
                      style: TextStyle(
                        color: Color(0xff2D5356),
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
