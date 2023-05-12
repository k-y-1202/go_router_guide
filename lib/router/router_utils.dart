enum APP_PAGE {
  login,
  home,
  mypage,
  mypageEdit,
}

extension AppPageExtention on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.login:
        return '/login';

      case APP_PAGE.home:
        return '/';
      case APP_PAGE.mypage:
        return '/mypage';
      case APP_PAGE.mypageEdit:
        return 'edit/:userId';

      default:
        return '/';
    }
  }
}
