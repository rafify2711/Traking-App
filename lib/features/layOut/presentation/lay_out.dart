import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/home_view.dart';
import 'package:tracking_app/features/orders/presentation/orders_view.dart';
import 'package:tracking_app/features/profile/presentation/profile_view.dart';

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const OrdersView(),
    const ProfileView(),
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
        // selectedItemColor: PalletsColors.mainColorBase,
        // unselectedItemColor: PalletsColors.gray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.microwave_outlined),
            label: "orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "profile",
          ),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
