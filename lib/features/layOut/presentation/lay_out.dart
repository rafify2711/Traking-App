import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/features/home/presentation/views/home_screen.dart';
import 'package:tracking_app/features/order_tap/presentation/view/driver_order_view.dart';
import 'package:tracking_app/features/profile_tab/profile_view.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
     DriverOrderView(),
     ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: LocaleKeys.home.tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.microwave_outlined),
            label: LocaleKeys.orders.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_2_outlined),
            label: LocaleKeys.profile.tr(),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
