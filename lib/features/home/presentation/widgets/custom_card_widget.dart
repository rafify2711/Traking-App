import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/helper_func/url_launcher.dart';

class CustomCardWidget extends StatelessWidget {
  final bool withTrailing;
  final String imagePath;
  final String title;
  final String addressOrPriceText;
  final String numberOfOrder;
  const CustomCardWidget({
    super.key,
    required this.withTrailing,
    required this.imagePath,
    required this.addressOrPriceText,
    required this.title,
    required this.numberOfOrder,
  });

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "tel:+201151442898";
    String whatsAppUrl = "https://wa.me/201151442898";
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
            leading: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 25,
            ),

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,

                  style: AppTextStyles.instance.textStyle13.copyWith(
                    color: PalletsColors.gray,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: PalletsColors.black70,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        addressOrPriceText,
                        style: AppTextStyles.instance.textStyle13,
                      ),
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
                            onTap: () async {
                              await launchCustomUrl(context, phoneNumber);
                            },
                            child: const Icon(
                              Icons.local_phone_outlined,
                              color: PalletsColors.mainColorBase,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: PalletsColors.mainColorBase,
                              size: 20,
                            ),
                            onPressed: () async {
                              await launchCustomUrl(context, whatsAppUrl);
                            },
                          ),
                        ],
                      ),
                    )
                    : Text(
                      numberOfOrder,
                      style: const TextStyle(
                        color: PalletsColors.mainColorBase,
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}
