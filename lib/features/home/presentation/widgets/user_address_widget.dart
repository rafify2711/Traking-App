import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';

class UserAddressWidget extends StatelessWidget {
  bool withTrailing;
  UserAddressWidget({super.key, required this.withTrailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Photo.png"),
              radius: 16,
            ),

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Nour mohamed",
                  style: AppTextStyles.instance.textStyle13.copyWith(
                    color: PalletsColors.gray,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: PalletsColors.black70,
                    ),
                    const SizedBox(width: 10),
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
                            child: const Icon(
                              Icons.local_phone_outlined,
                              color: PalletsColors.mainColorBase,
                              size: 16,
                            ),
                          ),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: PalletsColors.mainColorBase,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                    : const Text(""),
          ),
        ),
      ],
    );
  }
}
