import 'package:flutter/material.dart';
import 'package:internet_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Internet App", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF9F7BFF),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text(
          "Home Screen",
        ),
      ),
    );
  }
}
