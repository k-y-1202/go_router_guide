import 'package:flutter/material.dart';
import 'package:go_router_guide/pages/profile_edit_page.dart';

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ProfileEditPage(userId: 'aiueo1234');
                },
              ));
            },
            child: const Text('プロフィール編集'),
          ),
        ],
      )),
    );
  }
}
