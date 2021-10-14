import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested_router_test/root_page.dart';

class RootDelegate extends RouterDelegate<int> with ChangeNotifier, PopNavigatorRouterDelegateMixin<int> {
  var _pagesCount = 1;

  void increasePages() {
    _pagesCount++;
    notifyListeners();
  }

  bool _decreasePages() {
    if (_pagesCount > 1) {
      _pagesCount--;
      notifyListeners();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.generate(
        _pagesCount,
        (index) => MaterialPage(
          child: RootPage(
            index: index,
          ),
        ),
      ),
      onPopPage: (route, value) {
        return _decreasePages();
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    return _decreasePages();
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    print('ROOT - method: setNewRoutePath');
    print('ROOT - configuration: $configuration');

    _pagesCount = configuration;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}

class AppRouteInformationParser extends RouteInformationParser<int> {
  @override
  Future<int> parseRouteInformation(RouteInformation routeInformation) async {
    return 1;
  }
}
