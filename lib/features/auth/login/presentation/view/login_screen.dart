import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/constants.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/core/utils/services/secure_sotrage_service.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:tracking_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:tracking_app/features/auth/login/presentation/view_model/login_state.dart';
import '../../../../../generated/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    _loadRememberMeState();
  }

  Future<void> _loadRememberMeState() async {
    final savedState = await SecureStorageService().readSecureData(
      Constants.rememberMe,
    );
    if (savedState != null) {
      setState(() {
        rememberMe = savedState == 'true';
      });
    }
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void dispose() {
    emailController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFilled =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginUsecase>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          titleSpacing: 0,
          title: Text(
            LocaleKeys.login.tr(),
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                const SizedBox(height: 36),
                CustomTextFormFieled(
                  hintText: LocaleKeys.enterYourEmail.tr(),
                  labelText: LocaleKeys.email.tr(),
                  textEditingController: emailController,
                  validator: (value) => Validator.validateEmail(value),
                  isObsecureText: false,
                ),
                const SizedBox(height: 16),
                CustomTextFormFieled(
                  hintText: LocaleKeys.enterYourPassword.tr(),
                  labelText: LocaleKeys.password.tr(),
                  textEditingController: passwordController,
                  validator: (value) => Validator.validatePassword(value),
                  isObsecureText: true,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (val) {
                        setState(() {
                          rememberMe = val ?? rememberMe;
                        });
                      },
                      activeColor: PalletsColors.mainColorBase,
                      checkColor: Colors.white,
                    ),
                    Text(
                      LocaleKeys.remmemberMe.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: Text(
                        LocaleKeys.forgetPassword.tr(),
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(12, 16, 21, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) async {
                      if (state.loginState is BaseError<LoginResponse>) {
                        showErrorSnackBar(
                          context,
                          (state.loginState as BaseError<LoginResponse>)
                                  .errorMessage ??
                              "",
                        );
                      } else if (state.loginState
                          is BaseSuccess<LoginResponse>) {
                        showSnackBar(
                          context,
                          LocaleKeys.loggedInSuccessfully.tr(),
                        );
                        await _saveUserToken(
                          state.loginState as BaseSuccess<LoginResponse>,
                        );
                        await _saveRememberMeState();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesName.layOut,
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            autoValidateMode = AutovalidateMode.disabled;
                          } else {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isFilled
                                  ? PalletsColors.mainColorBase
                                  : PalletsColors.black30,
                        ),
                        child: Center(
                          child:
                              state.loginState is BaseLoading<LoginResponse>
                                  ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: PalletsColors.white10,
                                    ),
                                  )
                                  : Text(LocaleKeys.continueText.tr()),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveUserToken(BaseSuccess<LoginResponse> state) async {
    await SecureStorageService().writeSecureData(
      Constants.userToken,
      state.data?.token ?? "",
    );
    final String? token = await SecureStorageService().readSecureData(
      Constants.userToken,
    );
    log("user token is $token");
  }

  Future<void> _saveRememberMeState() async {
    await SecureStorageService().writeSecureData(
      Constants.rememberMe,
      rememberMe.toString(),
    );
  }
}
