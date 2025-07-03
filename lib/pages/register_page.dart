import 'package:epicBid/cubits/auth_cubit/auth_cubit.dart';
import 'package:epicBid/cubits/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';
import '../services/snack_bar_service.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscured = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            SnackBarService.showSuccessMessage("Account created successfully!");
            Navigator.pushNamed(context, HomePage.id);
          } else if (state is RegisterFailedState) {
            SnackBarService.showErrorMessage(state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Header container (unchanged)
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff2D5356), Color(0xff738D8F)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, left: 36),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang?.now ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 32,
                                ),
                              ),
                              Text(
                                lang?.createYourAccount ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 34,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Form content with constrained height and explicit spacing
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 40),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height -
                                250 -
                                80, // Subtract header and SafeArea/padding
                          ),
                          child: Column(
                            children: [
                              _buildTextField(
                                controller: nameController,
                                hint: lang?.fullName ?? '',
                                iconPath: "assets/icons/user.png",
                                validator: (val) => val!.isEmpty
                                    ? "Please enter your name"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                              _buildTextField(
                                controller: emailController,
                                hint: lang?.emailAddress ?? '',
                                iconPath: "assets/icons/email.png",
                                validator: (val) {
                                  if (val == null || val.isEmpty)
                                    return "Please enter email";
                                  final regex = RegExp(
                                      r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");
                                  return regex.hasMatch(val)
                                      ? null
                                      : "Invalid email";
                                },
                              ),
                              const SizedBox(height: 15),
                              _buildTextField(
                                controller: passwordController,
                                hint: lang?.password ?? '',
                                iconPath: "assets/icons/password.png",
                                isPassword: true,
                                obscureText: isObscured,
                                onToggleVisibility: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                                validator: (val) => val!.isEmpty
                                    ? "Please enter your password"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                              _buildTextField(
                                controller: phoneController,
                                hint: lang?.phone ?? '',
                                iconData: Icons.phone,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Please enter your phone";
                                  }
                                  if (int.tryParse(val) == null) {
                                    return "Enter a valid number";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Icon(Icons.check_box_outline_blank,
                                      size: 15),
                                  const SizedBox(width: 5),
                                  Text(
                                    lang?.iAgreeToTheTerms ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff468286),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    lang?.termsAndConditions ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff2D5356),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context)
                                        .register(
                                      name: nameController.text,
                                      userName: emailController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff2D5356),
                                        Color(0xff738D8F)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      lang?.signUp ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    lang?.haveAnAccount ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff468286),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, LoginPage.id),
                                    child: Text(
                                      lang?.signIn ?? '',
                                      style: const TextStyle(
                                        color: Color(0xff2D5356),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: 20), // Extra bottom padding
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
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    String? iconPath,
    IconData? iconData,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: Color(0xff4C4C4C)),
      cursorColor: const Color(0xff4C4C4C),
      decoration: InputDecoration(
        prefixIcon: iconPath != null
            ? ImageIcon(AssetImage(iconPath), color: const Color(0xff4C4C4C))
            : Icon(iconData, color: const Color(0xff979797)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  color: const Color(0xff4C4C4C),
                ),
                onPressed: onToggleVisibility,
              )
            : null,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xff4C4C4C),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Color(0xff2D5356), width: 0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Color(0xff2D5356), width: 0.8),
        ),
      ),
    );
  }
}
