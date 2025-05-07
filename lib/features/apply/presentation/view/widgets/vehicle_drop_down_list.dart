import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/application_theme.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/apply/data/models/get_all_vehicles_response/vehicle.dart';

class VehicleDropDownList extends StatelessWidget {
  final Vehicle? selectedItem;
  final List<Vehicle> items;
  final ValueChanged<Vehicle?> onChanged;
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
    return DropdownButtonFormField<Vehicle>(
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: PalletsColors.white90,
      ),
      value: selectedItem,
      onChanged: onChanged,
      isExpanded: true,
         items: items.map(
        (v) => DropdownMenuItem<Vehicle>(
          value: v,
          child: Text(
            v.type ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ApplicationTheme.themeData.textTheme.bodyLarge
                ?.copyWith(color: PalletsColors.blackBase),
          ),
        ),
      ).toList(),

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
