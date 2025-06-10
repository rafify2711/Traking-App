import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';
import 'package:tracking_app/features/editProfile/data/model/updated_user_model.dart';
import 'package:tracking_app/features/editProfile/presentation/viewModel/cubit/edit_profile_cubit.dart';
import 'package:tracking_app/features/editProfile/presentation/viewModel/cubit/edit_profile_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class EditProfileView extends StatefulWidget {
  final Driver driver;
  const EditProfileView({super.key, required this.driver});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;

  File? selectedImage;

  @override
  void initState() {
    super.initState();

    log('*****${widget.driver.firstName}');
    firstNameController = TextEditingController(text: widget.driver.firstName);
    lastNameController = TextEditingController(text: widget.driver.lastName);
    emailController = TextEditingController(text: widget.driver.email);
    phoneNumberController = TextEditingController(text: widget.driver.phone);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    } else {
      selectedImage = File(widget.driver.photo!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final cubit = context.read<EditProfileCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(LocaleKeys.editProfile.tr(), style: text.titleMedium),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state.status == EditProfileStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(LocaleKeys.profileUpdatedSuccessfully.tr()),
              ),
            );
          } else if (state.status == EditProfileStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? LocaleKeys.updateFailed.tr(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                selectedImage != null
                                    ? FileImage(selectedImage!)
                                    : (widget.driver.photo != null
                                            ? NetworkImage(widget.driver.photo!)
                                            : const AssetImage(''))
                                        as ImageProvider,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),

                                color: PalletsColors.mainColor30,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                onPressed: pickImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),

                    // First & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFieled(
                            labelText: LocaleKeys.firstName.tr(),
                            isObsecureText: false,
                            textEditingController: firstNameController,
                            validator: Validator.validateName,
                            hintText: '',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextFormFieled(
                            labelText: LocaleKeys.lastName.tr(),
                            isObsecureText: false,
                            textEditingController: lastNameController,
                            validator: Validator.validateName,
                            hintText: '',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Email
                    CustomTextFormFieled(
                      labelText: LocaleKeys.email.tr(),
                      isObsecureText: false,
                      textEditingController: emailController,
                      validator: Validator.validateEmail,
                      hintText: '',
                    ),
                    const SizedBox(height: 12),

                    // Phone Number
                    CustomTextFormFieled(
                      labelText: LocaleKeys.phoneNumber.tr(),
                      isObsecureText: false,
                      textEditingController: phoneNumberController,
                      validator: Validator.validatePhoneNumber,
                      hintText: '',
                    ),
                    const SizedBox(height: 30),

                    CustomTextFormFieled(
                      hintText: LocaleKeys.enterYourPassword.tr(),
                      labelText: LocaleKeys.password.tr(),
                      isObsecureText: true,
                      readOnly: true,
                      textEditingController: TextEditingController(
                        text: '*********',
                      ),
                      suffix: GestureDetector(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            LocaleKeys.change.tr(),
                            style: AppTextStyles.instance.textStyle14.copyWith(
                              color: PalletsColors.mainColorBase,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),

                    const SizedBox(height: 100),

                    // Save Button
                    if (state.status == EditProfileStatus.loading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final updatedUser = UpdatedUserModel(
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              email: emailController.text.trim(),
                              phone: phoneNumberController.text.trim(),
                            );
                            if (selectedImage != null) {
                              await cubit.uploadProfilePhoto(selectedImage);
                            }
                            await cubit.editProfile(updatedUser);
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        child: Text(LocaleKeys.updateProfile.tr()),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
