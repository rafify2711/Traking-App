import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/services/image_picker.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/vehicle.dart';
import 'package:tracking_app/features/auth/apply/presentation/view/widgets/vehicle_drop_down_list.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class EditVehicleScreen extends StatelessWidget {
  const EditVehicleScreen({super.key, required this.getVehicleResponse, required this.getLoggedDriverDataResponse});
final GetVehicleResponse getVehicleResponse;
final GetLoggedDriverDataResponse getLoggedDriverDataResponse;
  @override
  Widget build(BuildContext context) {
     var vehicleNumberController = TextEditingController();
    vehicleNumberController.text=getLoggedDriverDataResponse.driver!.NID!;
     var vehicleLicenseController = TextEditingController();
     vehicleLicenseController.text=getLoggedDriverDataResponse.driver!.vehicleLicense!;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(LocaleKeys.editVehicle.tr()),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [




              VehicleDropDownList(
                labelText: LocaleKeys.vehicleType.tr(),
                onChanged: (vehicle) {
                  // cubit.setVehicleType(vehicle);
                  // setState(() {
                  //   state.selectedVehicle = vehicle;
                  // });
                },
                selectedItem: getVehicleResponse.vehicle as Vehicle,
                items: [],
              ),

              SizedBox(height: responsiveHeight(24)),

              CustomTextFormFieled(
                textEditingController: vehicleNumberController,
                labelText: LocaleKeys.vehicleNumber.tr(),
                hintText: LocaleKeys.enterVehicleNumber.tr(),
                isObsecureText: false,
                validator: (val) => Validator.validateVehicleNumber(val),
              ),
              SizedBox(height: responsiveHeight(24)),

              CustomTextFormFieled(
                suffix: const Icon(Icons.file_upload_outlined),
                textEditingController: vehicleLicenseController,
                labelText: LocaleKeys.vehicleLicense.tr(),
                hintText: LocaleKeys.uploadLicensePhoto.tr(),
                isObsecureText: false,
                readOnly: true,
                onTap: () async {
                  final image = await showImageSourcePicker(context);
                  if (image != null) {
                    // cubit.setVehicleImage(image);
                  }
                },
              ),

              // BlocConsumer<ApplyCubit, ApplyState>(
              //   listener: (context, state) {
              //     if (state.applyState is BaseError<ApplyResponse>) {
              //       showErrorSnackBar(
              //         context,
              //         (state.applyState as BaseError<ApplyResponse>)
              //             .errorMessage ??
              //             "Something went wrong",
              //       );
              //     } else if (state.applyState is BaseSuccess<ApplyResponse>) {
              //       showSnackBar(context, state.applyResponse?.message ?? "");
              //       Navigator.pushNamed(context, RoutesName.loginScreen);
              //     }
              //   },
              //   builder: (context, state) {
              //     return
                    ElevatedButton(
                    onPressed: () async {
                      // if (formKey.currentState!.validate()) {
                      //   if (cubit.vehicleLicenseFile == null ||
                      //       cubit.idImageFile == null) {
                      //     showErrorSnackBar(
                      //       context,
                      //       "Please upload all required files",
                      //     );
                      //     return;
                      //   }
                      //   await cubit.apply(
                      //     ApplyData(
                      //       country: state.selectedCountry?.name ?? "",
                      //       firstName: cubit.firstNameController.text,
                      //       lastName: cubit.secondNameController.text,
                      //       vehicleType: state.selectedVehicle?.id ?? "",
                      //
                      //       vehicleNumber: cubit.vehicleNumberController.text,
                      //       vehicleLicense: cubit.vehicleLicenseFile!,
                      //       email: cubit.emailController.text,
                      //       phoneNumber: cubit.phoneNumberController.text,
                      //       idNumber: cubit.idNumberController.text,
                      //       idImage: cubit.idImageFile!,
                      //       password: cubit.passwordController.text,
                      //       confirmPassword:
                      //       cubit.confirmPasswordController.text,
                      //       gender: state.selectedGender.name,
                      //     ),
                      //   );
                      //   autovalidateMode = AutovalidateMode.disabled;
                      // } else {
                      //   setState(() {
                      //     autovalidateMode = AutovalidateMode.always;
                      //   });
                      // }
                    },
                    child:
                    // state.applyState is BaseLoading
                    //     ? const SizedBox(
                    //   height: 24,
                    //   width: 24,
                    //   child: CircularProgressIndicator(
                    //     color: PalletsColors.white10,
                    //   ),
                    // )
                    //     :
                      const Text('Continue'),
                  ),


              SizedBox(height: responsiveHeight(24)),
            ],
          ),
        ),
      )
    );
  }
}
