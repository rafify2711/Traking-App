import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 149, right: 30, left: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/check-circle.png", scale: 5),
              SizedBox(height: 24),
              Text(
                "Your application has been ",
                style: AppTextStyles.instance.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "submitted!",
                style: AppTextStyles.instance.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Thank you for providing your application, we will review your application and will get back to you soon.",
                style: AppTextStyles.instance.textStyle16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 72),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.loginView);
                },
                child: Text("Login", style: AppTextStyles.instance.textStyle16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Image.asset("assets/images/bg.png"),
    );
  }
}
