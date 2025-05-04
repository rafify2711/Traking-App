import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/enums/gender_enum.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/apply/data/models/country_model/country_model.dart';
import 'package:tracking_app/features/apply/presentation/view/widgets/vehicle_drop_down_list.dart';
import 'package:tracking_app/features/apply/presentation/view/widgets/welcome_text_in_apply_view.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

import 'country_drop_down_list.dart';

class ApplyViewBody extends StatefulWidget {
  const ApplyViewBody({super.key});

  @override
  State<ApplyViewBody> createState() => _ApplyViewBodyState();
}

class _ApplyViewBodyState extends State<ApplyViewBody> {
  late TextEditingController countryController;
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController vehicleTypeController;
  late TextEditingController vehicleNumberController;
  late TextEditingController vehicleLicenseController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController idNumberController;
  late TextEditingController idImageController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  Gender selectedGender = Gender.female;
  List<String> vehicleList = ["Bike", "Car", "Motorcycles", "Scooter"];
  String? selectedItem;
  CountryModel? selectedCountry;
  List<CountryModel> countryList = [];
  bool isLoading = false;

  @override
  void initState() {
    countryController = TextEditingController();
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    vehicleTypeController = TextEditingController();
    vehicleNumberController = TextEditingController();
    vehicleLicenseController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    idNumberController = TextEditingController();
    idImageController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    setState(() => isLoading = true);
    countryList = await CountryModel.getCountryFromAssets(context);
    if (countryList.isNotEmpty) {
      final egyptIndex = await CountryModel.getEgyptIndex(context); 
      selectedCountry = countryList[egyptIndex];
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
          child: CircularProgressIndicator(color: PalletsColors.mainColorBase),
        )
        : Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsiveHeight(24)),
                WelcomeTextInApplyView(),
                SizedBox(height: responsiveHeight(32)),

                CountryDropDownList(
                  onChanged: (CountryModel? value) {
                    selectedCountry = value;
                  },
                  selectedCountry: selectedCountry!,
                  countries: countryList,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  textEditingController: firstNameController,
                  labelText: LocaleKeys.firstLegalName.tr(),
                  hintText: LocaleKeys.enterFirstLegalName.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  textEditingController: secondNameController,
                  labelText: LocaleKeys.secondLegalName.tr(),
                  hintText: LocaleKeys.enterSecondLegalName.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                VehicleDropDownList(
                  labelText: LocaleKeys.vehicleType.tr(),
                  onChanged: (value) {
                    selectedItem = value;
                  },
                  selectedItem: selectedItem ?? vehicleList[0],
                  items: vehicleList,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  textEditingController: vehicleNumberController,
                  labelText: LocaleKeys.vehicleNumber.tr(),
                  hintText: LocaleKeys.enterVehicleNumber.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  textEditingController: vehicleLicenseController,
                  labelText: LocaleKeys.vehicleLicense.tr(),
                  hintText: LocaleKeys.uploadLicensePhoto.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: emailController,
                  labelText: LocaleKeys.email.tr(),
                  hintText: LocaleKeys.enterYourEmail.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  keyboardType: TextInputType.phone,
                  textEditingController: phoneNumberController,
                  labelText: LocaleKeys.phoneNumber.tr(),
                  hintText: LocaleKeys.enterPhoneNumber.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  textEditingController: idNumberController,
                  labelText: LocaleKeys.idNumber.tr(),
                  hintText: LocaleKeys.enterNationalIdNumber.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                CustomTextFormFieled(
                  textEditingController: idImageController,
                  labelText: LocaleKeys.idImage.tr(),
                  hintText: LocaleKeys.uploadIdImage.tr(),
                  isObsecureText: false,
                ),
                SizedBox(height: responsiveHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFormFieled(
                        textEditingController: passwordController,
                        labelText: LocaleKeys.password.tr(),
                        hintText: LocaleKeys.enterPassword.tr(),
                        isObsecureText: true,
                      ),
                    ),
                    SizedBox(width: responsiveWidth(16)),
                    Expanded(
                      child: CustomTextFormFieled(
                        textEditingController: passwordController,
                        labelText: LocaleKeys.confirmPassword.tr(),
                        hintText: LocaleKeys.confirmPassword.tr(),
                        isObsecureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(24)),
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
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                      activeColor: PalletsColors.mainColorBase,
                    ),
                    Text(
                      "Female",
                      style: AppTextStyles.instance.textStyle14.copyWith(
                        color:
                            selectedGender == Gender.female
                                ? PalletsColors.blackBase
                                : PalletsColors.gray,
                      ),
                    ),

                    Radio<Gender>(
                      activeColor: PalletsColors.mainColorBase,
                      value: Gender.male,
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            selectedGender == Gender.male
                                ? PalletsColors.blackBase
                                : PalletsColors.gray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(24)),
                ElevatedButton(onPressed: () {}, child: Text("Continue")),
                SizedBox(height: responsiveHeight(24)),
              ],
            ),
          ),
        );
  }
}
