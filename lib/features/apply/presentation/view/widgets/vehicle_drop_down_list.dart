import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/application_theme.dart';
import 'package:tracking_app/core/utils/colors.dart';

class VehicleDropDownList extends StatelessWidget {
  final String selectedItem;
  final List<dynamic> items;
  final ValueChanged<String?> onChanged;
  final String? labelText;
  final String? hintText;

  const VehicleDropDownList({
    super.key,
    required this.onChanged,
    required this.selectedItem,
    required this.items,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: PalletsColors.white90,
      ),
      value: selectedItem,
      onChanged: onChanged,
      isExpanded: true,
      items:
          items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    e,
                    style: ApplicationTheme.themeData.textTheme.bodyLarge
                        ?.copyWith(color: PalletsColors.blackBase),
                  ),
                ),
              )
              .toList(),

      decoration: InputDecoration(
        labelText: labelText,
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
