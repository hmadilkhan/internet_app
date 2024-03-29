import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_app/screens/customer_screen.dart';
import 'package:internet_app/screens/home_screen.dart';
import 'package:internet_app/screens/vouchers_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String name = "";
  @override
  void initState() {
    super.initState();
    setvalues();
  }

  void setvalues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                // color: Colors.blue,
                ),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.png"),
                  radius: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Get.off(() => const HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_rounded),
            title: const Text(
              'Customers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Get.off(() => const CustomerScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_rounded),
            title: const Text(
              'Vouchers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Get.off(() => const VoucherScreen());
            },
          ),
        ],
      ),
    );
  }
}
