import 'package:flutter/material.dart';
import 'package:go_router_guide/bottom_navigation_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログインページ'),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('ログインする'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationPage(),
            ),
          );
        },
      )),
    );
  }
}
