import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';

class PickUpAddressWidget extends StatelessWidget {
  bool withTrailing;
  PickUpAddressWidget({super.key, required this.withTrailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/Flowery logo.png"),
              radius: 16,
            ),

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Flowery store",
                  style: AppTextStyles.instance.textStyle13.copyWith(
                    color: PalletsColors.gray,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: PalletsColors.black70,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "20th st, Sheikh Zayed, Giza ",
                      style: AppTextStyles.instance.textStyle13,
                    ),
                  ],
                ),
              ],
            ),

            trailing:
                withTrailing
                    ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.local_phone_outlined,
                              color: PalletsColors.mainColorBase,
                              size: 16,
                            ),
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: PalletsColors.mainColorBase,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                    : Text(""),
          ),
        ),
      ],
    );
  }
}
