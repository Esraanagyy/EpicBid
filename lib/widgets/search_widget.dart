import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
    required this.textColor,
    required this.fillColor,
  });
  Color textColor;
  Color fillColor;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return TextFormField(
      onChanged: (input) {},
      style: TextStyle(
        color: textColor,
      ),
      cursorColor: const Color(0xff468286),
      decoration: InputDecoration(
        fillColor: fillColor,
        focusColor: fillColor,
        filled: true,
        prefixIcon: ImageIcon(
          const AssetImage("assets/icons/search.png"),
          color: textColor,
        ),
        hintText: lang?.searchInStore,
        hintStyle: TextStyle(
          color: textColor,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(18), // Same radius as focusedBorder
        ),
      ),
    );
  }
}
