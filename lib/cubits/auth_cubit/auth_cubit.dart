import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:epicBid/cubits/auth_cubit/auth_states.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  //register service

  void register(
      {required String name,
      required String userName,
      required String email,
      required String password,
      required String phone}) async {
    emit(RegisterLoadingState());
    try {
      http.Response response = await http.post(
        Uri.parse('http://ebic-bid11.runasp.net/api/Account/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'displayName': name,
          'userName': userName,
          'email': email,
          'password': password,
          'phone': phone,
        }),
      );

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(RegisterSuccessState());
      } else {
        emit(RegisterFailedState(
            message: responseBody['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      print('Error during registration: $e');
      emit(RegisterFailedState(message: 'Something went wrong: $e'));
    }
  }

  //login services
  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    http.Response response = await http.post(
      Uri.parse('http://ebic-bid11.runasp.net/api/Account/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState(message: responseBody['message']));
    }
  }

  //forget password service
  void forgotPassword({required String email}) async {
    emit(PasswordLoadingState());
    http.Response response = await http.post(
      Uri.parse('http://ebic-bid11.runasp.net/api/Account/forgetpassword'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
      }),
    );
    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      emit(PasswordSuccessState());
    } else {
      emit(PasswordFailedState(message: responseBody['message']));
    }
  }

  //verify code
  void verifyCode({required String email, required int code}) async {
    http.Response response = await http.post(
      Uri.parse('http://ebic-bid11.runasp.net/api/Account/verifycode'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'resetcode': code,
      }),
    );
    if (response.statusCode == 200) {
      emit(VerifySuccessState());
    } else {
      emit(VerifyFailedState());
    }
  }

  //reset password
  void resetPassword({required String email, required String password}) async {
    http.Response response = await http.put(
      Uri.parse('http://ebic-bid11.runasp.net/api/Account/resetpassword'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'newpassword': password,
      }),
    );
    if (response.statusCode == 200) {
      emit(ResetSuccessState());
    } else {
      emit(ResetFailedState());
    }
  }
}
