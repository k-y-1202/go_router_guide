import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_guide/pages/profile_edit_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const userId = '123abc';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('マイページ'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.push(
                '/mypage/edit/$userId',
                extra: userId,
              );
            },
            child: const Text('プロフィール編集'),
          ),
        ],
      )),
    );
  }
}
