import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/language_cubit/language_cubit.dart';
import '../l10n/app_localizations.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});
  static String id = 'lang';

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    final currentLocale = context.watch<LanguageCubit>().state;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Return to previous page
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: Text(
          lang?.language ?? 'Language',
          style: TextStyle(
            color: Colors.black,
            fontFamily: currentLocale.languageCode == 'ar' ? 'Amiri' : 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: GestureDetector(
              onTap: () {
                context.read<LanguageCubit>().setEnglish();
              },
              child: Container(
                width: 404,
                height: 62,
                decoration: BoxDecoration(
                  color: currentLocale.languageCode == 'en'
                      ? const Color(0xff79B5B9)
                      : const Color(0xffCCCCCC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lang?.english ?? 'English',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: GestureDetector(
              onTap: () {
                context.read<LanguageCubit>().setArabic();
              },
              child: Container(
                width: 404,
                height: 62,
                decoration: BoxDecoration(
                  color: currentLocale.languageCode == 'ar'
                      ? const Color(0xff79B5B9)
                      : const Color(0xffCCCCCC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lang?.arabic ?? 'Arabic',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: currentLocale.languageCode == 'ar'
                            ? 'Amiri'
                            : 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
