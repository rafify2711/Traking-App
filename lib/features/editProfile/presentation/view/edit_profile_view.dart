import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';

class EditProfileView extends StatefulWidget {
  // final Driver driver;
  const EditProfileView({
    super.key,
    // required this.driver
  });

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final TextEditingController textEditingController;
  late final String labelText;
  late final String hintText;
  late final bool isObsecureText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: .8,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 74),
          // CustomTextFormFieled(
          //   textEditingController: textEditingController,
          //   labelText: labelText,
          //   hintText: hintText,
          //   isObsecureText: isObsecureText,
          // ),
        ],
      ),
    );
  }
}
