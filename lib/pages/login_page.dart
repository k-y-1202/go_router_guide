import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_guide/pages/bottom_navigation_page.dart';

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
          context.go('/home');
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return const BottomNavigationPage();
          //   }),
          //   (_) => false,
          // );
        },
      )),
    );
  }
}
