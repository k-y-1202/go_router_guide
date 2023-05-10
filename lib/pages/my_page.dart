import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('マイページ'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('プロフィール編集'),
          ),
        ],
      )),
    );
  }
}
