import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final gender = ValueNotifier<String>('Male');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
        leading: const BackButton(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/avatar.jpg',
                    ), // Replace with user image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: _TextField(label: 'First name', initialValue: 'John'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _TextField(label: 'Last name', initialValue: 'Doe'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _TextField(label: 'Email', initialValue: 'JohnDoe@gmail.com'),
            const SizedBox(height: 16),
            const _TextField(
              label: 'Phone number',
              initialValue: '012113456789',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: _TextField(
                    label: 'Password',
                    initialValue: '******',
                    obscureText: true,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(onPressed: () {}, child: const Text('Change')),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: gender,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Radio<String>(
                      value: 'Female',
                      groupValue: value,
                      onChanged: (val) => gender.value = val!,
                    ),
                    const Text('Female'),
                    const SizedBox(width: 20),
                    Radio<String>(
                      value: 'Male',
                      groupValue: value,
                      onChanged: (val) => gender.value = val!,
                    ),
                    const Text('Male'),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Update', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final bool obscureText;

  const _TextField({
    required this.label,
    required this.initialValue,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }
}






  // late final TextEditingController textEditingController;
  // late final String labelText;
  // late final String hintText;
  // late final bool isObsecureText;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "Edit Profile",
  //         style: AppTextStyles.instance.textStyle20.copyWith(
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       titleSpacing: .8,
  //       leading: const Icon(Icons.arrow_back_ios),
  //     ),
  //     body: const Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       // crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         CircleAvatar(radius: 74),
  //         // CustomTextFormFieled(
  //         //   textEditingController: textEditingController,
  //         //   labelText: labelText,
  //         //   hintText: hintText,
  //         //   isObsecureText: isObsecureText,
  //         // ),
  //       ],
  //     ),
  //   );
  // }
