import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')) {
    print('LanguageCubit initialized with: en');
  }

  void setEnglish() {
    print('Emitting Locale: en');
    emit(const Locale('en'));
  }

  void setArabic() {
    print('Emitting Locale: ar');
    emit(const Locale('ar'));
  }
}
