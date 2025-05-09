import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/enums/gender_enum.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/services/image_picker.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/presentation/view/widgets/country_drop_down_list.dart';
import 'package:tracking_app/features/apply/presentation/view/widgets/vehicle_drop_down_list.dart';

import 'package:tracking_app/features/apply/presentation/view/widgets/welcome_text_in_apply_view.dart';
import 'package:tracking_app/features/apply/presentation/view_model/cubit/apply_cubit.dart';
import 'package:tracking_app/features/apply/presentation/view_model/cubit/apply_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ApplyScreenBody extends StatefulWidget {
  const ApplyScreenBody({super.key});

  @override
  State<ApplyScreenBody> createState() => _ApplyScreenBodyState();
}

class _ApplyScreenBodyState extends State<ApplyScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? selectedVehicle;
  List<String> vehiclesType = [];

  @override
  void initState() {
    context.read<ApplyCubit>().loadCountries(context);
    context.read<ApplyCubit>().getVehicles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ApplyCubit>();
    final state = context.watch<ApplyCubit>().state;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: PalletsColors.mainColorBase),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: resposiveHeight(24)),
              const WelcomeTextInApplyView(),
              SizedBox(height: resposiveHeight(32)),

              CountryDropDownList(
                onChanged: (value) => cubit.setSelectedCountry(value!),
                selectedCountry: state.selectedCountry!,
                countries: state.countries,
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                textEditingController: cubit.firstNameController,
                labelText: LocaleKeys.firstLegalName.tr(),
                hintText: LocaleKeys.enterFirstLegalName.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validateName(val),
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                textEditingController: cubit.secondNameController,
                labelText: LocaleKeys.secondLegalName.tr(),
                hintText: LocaleKeys.enterSecondLegalName.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validateName(val),
              ),
              SizedBox(height: resposiveHeight(24)),

              VehicleDropDownList(
                labelText: LocaleKeys.vehicleType.tr(),
                onChanged: (vehicle) {
                  cubit.setVehicleType(vehicle);
                  setState(() {
                    state.selectedVehicle = vehicle;
                  });
                },
                selectedItem: state.selectedVehicle,
                items: state.vehicles ?? [],
              ),

              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                textEditingController: cubit.vehicleNumberController,
                labelText: LocaleKeys.vehicleNumber.tr(),
                hintText: LocaleKeys.enterVehicleNumber.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validateVehicleNumber(val),
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                suffix: const Icon(Icons.file_upload_outlined),
                textEditingController: cubit.vehicleLicenseController,
                labelText: LocaleKeys.vehicleLicense.tr(),
                hintText: LocaleKeys.uploadLicensePhoto.tr(),
                isObsecureText: false,
                readOnly: true,
                onTap: () async {
                  final image = await showImageSourcePicker(context);
                  if (image != null) {
                    cubit.setVehicleImage(image);
                  }
                },
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                keyboardType: TextInputType.emailAddress,
                textEditingController: cubit.emailController,
                labelText: LocaleKeys.email.tr(),
                hintText: LocaleKeys.enterYourEmail.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validateEmail(val),
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                keyboardType: TextInputType.phone,
                textEditingController: cubit.phoneNumberController,
                labelText: LocaleKeys.phoneNumber.tr(),
                hintText: LocaleKeys.enterPhoneNumber.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validatePhoneNumber(val),
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                textEditingController: cubit.idNumberController,
                labelText: LocaleKeys.idNumber.tr(),
                hintText: LocaleKeys.enterNationalIdNumber.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validateIdNumber(val),
              ),
              SizedBox(height: resposiveHeight(24)),

              CustomTextFormFieled(
                suffix: const Icon(Icons.file_upload_outlined),
                textEditingController: cubit.idImageController,
                labelText: LocaleKeys.idImage.tr(),
                hintText: LocaleKeys.uploadIdImage.tr(),
                isObsecureText: false,
                readOnly: true,
                onTap: () async {
                  final image = await showImageSourcePicker(context);
                  if (image != null) {
                    cubit.setIdImage(image);
                  }
                },
              ),
              SizedBox(height: resposiveHeight(24)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormFieled(
                      textEditingController: cubit.passwordController,
                      labelText: LocaleKeys.password.tr(),
                      hintText: LocaleKeys.enterPassword.tr(),
                      isObsecureText: true,
                      validator: (val) => Validator.validatePassword(val),
                    ),
                  ),
                  SizedBox(width: responsiveWidth(16)),
                  Expanded(
                    child: CustomTextFormFieled(
                      textEditingController: cubit.confirmPasswordController,
                      labelText: LocaleKeys.confirmPassword.tr(),
                      hintText: LocaleKeys.confirmPassword.tr(),
                      isObsecureText: true,
                      validator:
                          (val) => Validator.validateConfirmPassword(
                            val,
                            cubit.passwordController.text,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: resposiveHeight(24)),

              Row(
                children: [
                  Text(
                    LocaleKeys.gender.tr(),
                    style: AppTextStyles.instance.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Radio<Gender>(
                    value: Gender.female,
                    groupValue: state.selectedGender,
                    onChanged:
                        (value) => cubit.setGender(value ?? Gender.female),
                    activeColor: PalletsColors.mainColorBase,
                  ),
                  Text(
                    "Female",
                    style: AppTextStyles.instance.textStyle14.copyWith(
                      color:
                          state.selectedGender == Gender.female
                              ? PalletsColors.blackBase
                              : PalletsColors.gray,
                    ),
                  ),
                  Radio<Gender>(
                    value: Gender.male,
                    groupValue: state.selectedGender,
                    onChanged: (value) => cubit.setGender(value!),
                    activeColor: PalletsColors.mainColorBase,
                  ),
                  Text(
                    "Male",
                    style: AppTextStyles.instance.textStyle14.copyWith(
                      color:
                          state.selectedGender == Gender.male
                              ? PalletsColors.blackBase
                              : PalletsColors.gray,
                    ),
                  ),
                ],
              ),
              SizedBox(height: resposiveHeight(24)),

              BlocConsumer<ApplyCubit, ApplyState>(
                  listener: (context, state) {
                    if (state.applyState is BaseError<ApplyResponse>) {
                      showErrorSnackBar(
                        context,
                        (state.applyState as BaseError<ApplyResponse>).errorMessage ??
                         "Something went wrong",
                      );
                    } else if (state.applyState is BaseSuccess<ApplyResponse>) {
                      showSnackBar(context, state.applyResponse?.message ?? "");
                      Navigator.pushNamed(context, RoutesName.loginScreen);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  if (cubit.vehicleLicenseFile == null ||
                                      cubit.idImageFile == null) {
                                    showErrorSnackBar(
                                      context,
                                      "Please upload all required files",
                                    );
                                    return;
                                  }
                                  await cubit.apply(
                                    ApplyData(
                                      country: state.selectedCountry?.name ?? "",
                                      firstName: cubit.firstNameController.text,
                                      lastName: cubit.secondNameController.text,
                                      vehicleType: state.selectedVehicle?.id ?? "",
              
                                      vehicleNumber: cubit.vehicleNumberController.text,
                                      vehicleLicense: cubit.vehicleLicenseFile!,
                                      email: cubit.emailController.text,
                                      phoneNumber: cubit.phoneNumberController.text,
                                      idNumber: cubit.idNumberController.text,
                                      idImage: cubit.idImageFile!,
                                      password: cubit.passwordController.text,
                                      confirmPassword: cubit.confirmPasswordController.text,
                                      gender: state.selectedGender.name,
                                    ),
                                  );
                                  autovalidateMode = AutovalidateMode.disabled;
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
                                  });
                                }
                              },
                              child: state.applyState is BaseLoading ?
                               const  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: PalletsColors.white10,
                                    )):
                               const Text('Continue'),
                                
                            );
                },
              ),
              SizedBox(height: resposiveHeight(24)),
            ],
          ),
        ),
      ),
    );
  }
}
