import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/router_utils.dart';

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
                APP_PAGE.mypageEdit.toPath,
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
