import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/application_theme.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/apply/data/models/country_model/country_model.dart';

class CountryDropDownList extends StatelessWidget {
  final CountryModel selectedCountry;
  final List<CountryModel> countries;
  final ValueChanged<CountryModel?> onChanged;

  final String? hintText;

  const CountryDropDownList({
    super.key,
    required this.onChanged,
    required this.selectedCountry,
    required this.countries,

    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CountryModel>(
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: PalletsColors.white90,
      ),
      value: selectedCountry,
      onChanged: onChanged,
      isExpanded: true,
      items:
          countries
              .map(
                (e) => DropdownMenuItem<CountryModel>(
                  value: e,
                  child: Row(
                    spacing: responsiveWidth(8),
                    children: [
                      Text(e.flag ?? ""),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        e.name ?? "Egypt",
                        style: ApplicationTheme.themeData.textTheme.bodyLarge
                            ?.copyWith(
                              color: PalletsColors.blackBase,
                              height: 1.2,
                            ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),

      decoration: InputDecoration(
        labelText: "Country",
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall?.copyWith(
          color: PalletsColors.white90,
        ),
        hintText: hintText,
        hintStyle: ApplicationTheme.themeData.textTheme.bodyLarge?.copyWith(
          color: PalletsColors.white70,
        ),
        contentPadding: EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
      ),
    );
  }
}
