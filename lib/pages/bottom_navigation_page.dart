import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_guide/router/router_utils.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, required this.body});
  final Widget body;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _currentIndex = getCurrentIndex();
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) async {
          _currentIndex = index;
          setState(() {});

          switch (index) {
            case 0:
              context.go(APP_PAGE.home.toPath);
              break;
            case 1:
              context.go(APP_PAGE.mypage.toPath);
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
        ],
      ),
    );
  }

  int getCurrentIndex() {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(APP_PAGE.home.toPath)) {
      return 0;
    }
    if (location.startsWith(APP_PAGE.mypage.toPath)) {
      return 1;
    }
    return 0;
  }
}
