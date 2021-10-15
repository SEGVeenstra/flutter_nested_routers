import 'package:flutter/material.dart';
import 'package:nested_router_test/nested_page.dart';

class NestedDelegate extends RouterDelegate<int>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<int> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

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
          child: NestedPage(
            index: index,
          ),
        ),
      ),
      onPopPage: (route, value) {
        return route.didPop(_decreasePages());
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    print('NESTED ${_pagesCount - 1} - popRoute');
    return _decreasePages();
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    print('NESTED - method: setNewRoutePath');
    print('NESTED - configuration: $configuration');

    _pagesCount = configuration;
    notifyListeners();
  }
}
