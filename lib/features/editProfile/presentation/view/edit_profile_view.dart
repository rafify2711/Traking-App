import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/editProfile/data/model/updated_user_model.dart';
import 'package:tracking_app/features/editProfile/presentation/viewModel/cubit/edit_profile_cubit.dart';
import 'package:tracking_app/features/editProfile/presentation/viewModel/cubit/edit_profile_state.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class EditProfileView extends StatefulWidget {
  final GetLoggedDriverDataResponse driver;
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
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(
      text: widget.driver.driver?.firstName,
    )..addListener(_checkIfEdited);
    lastNameController = TextEditingController(
      text: widget.driver.driver?.lastName,
    )..addListener(_checkIfEdited);
    emailController = TextEditingController(text: widget.driver.driver?.email)
      ..addListener(_checkIfEdited);
    phoneNumberController = TextEditingController(
      text: widget.driver.driver?.phone,
    )..addListener(_checkIfEdited);
    selectedGender = widget.driver.driver?.gender;
    if (widget.driver.driver?.gender == 'male') {
      selectedGender = 'Male';
    } else if (widget.driver.driver?.gender == 'female') {
      selectedGender = 'Female';
    } else {
      selectedGender = 'Male';
    }
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
      selectedImage = File(widget.driver.driver?.photo ?? '');
    }
    _checkIfEdited();
  }

  bool _isEdited = false;

  void _checkIfEdited() {
    setState(() {
      _isEdited =
          firstNameController.text.trim() !=
              (widget.driver.driver?.firstName ?? '') ||
          lastNameController.text.trim() !=
              (widget.driver.driver?.lastName ?? '') ||
          emailController.text.trim() != (widget.driver.driver?.email ?? '') ||
          phoneNumberController.text.trim() !=
              (widget.driver.driver?.phone ?? '') ||
          selectedGender != (widget.driver.driver?.gender ?? '') ||
          selectedImage != null;
    });
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
        titleSpacing: 0,
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
                                    : (widget.driver.driver?.photo != null
                                            ? NetworkImage(
                                              widget.driver.driver?.photo ?? '',
                                            )
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

                                color: PalletsColors.mainColor10,
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
                    const SizedBox(height: 24),

                    // Email
                    CustomTextFormFieled(
                      labelText: LocaleKeys.email.tr(),
                      isObsecureText: false,
                      textEditingController: emailController,
                      validator: Validator.validateEmail,
                      hintText: '',
                    ),
                    const SizedBox(height: 24),

                    // Phone Number
                    CustomTextFormFieled(
                      labelText: LocaleKeys.phoneNumber.tr(),
                      isObsecureText: false,
                      textEditingController: phoneNumberController,
                      validator: Validator.validatePhoneNumber,
                      hintText: '',
                    ),
                    const SizedBox(height: 24),

                    CustomTextFormFieled(
                      hintText: LocaleKeys.enterYourPassword.tr(),
                      labelText: LocaleKeys.password.tr(),
                      isObsecureText: true,
                      readOnly: true,
                      textEditingController: TextEditingController(
                        text: '*********',
                      ),
                      suffix: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            LocaleKeys.change.tr(),
                            style: AppTextStyles.instance.textStyle14.copyWith(
                              color: PalletsColors.black50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.gender.tr(),
                          style: AppTextStyles.instance.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: PalletsColors.gray,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text(
                              LocaleKeys.male.tr(),
                              style: AppTextStyles.instance.textStyle14,
                            ),
                            value: 'Male',
                            groupValue: selectedGender,
                            activeColor:
                                PalletsColors
                                    .mainColorBase, // ✅ Pink circle when selected
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                                _checkIfEdited();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text(
                              LocaleKeys.female.tr(),
                              style: AppTextStyles.instance.textStyle14,
                            ),

                            value: 'Female',
                            groupValue: selectedGender,
                            activeColor:
                                PalletsColors
                                    .mainColorBase, // ✅ Pink circle when selected
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                                _checkIfEdited();
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    // Save Button
                    if (state.status == EditProfileStatus.loading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed:
                            _isEdited
                                ? () async {
                                  if (formKey.currentState!.validate()) {
                                    final updatedUser = UpdatedUserModel(
                                      firstName:
                                          firstNameController.text.trim(),
                                      lastName: lastNameController.text.trim(),
                                      email: emailController.text.trim(),
                                      phone: phoneNumberController.text.trim(),
                                      gender: selectedGender,
                                    );
                                    if (selectedImage != null) {
                                      await cubit.uploadProfilePhoto(
                                        selectedImage,
                                      );
                                    }
                                    await cubit.editProfile(updatedUser);
                                    Navigator.pop(context);
                                  } else {
                                    setState(() {
                                      autoValidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                }
                                : null, // Disabled if not edited
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _isEdited ? Colors.pink : Colors.grey,
                        ),
                        child: Text(LocaleKeys.update.tr()),
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
