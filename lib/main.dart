import 'package:flutter/material.dart';
import 'package:nested_router_test/root_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final rootDelegate = RootDelegate();
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: rootDelegate,
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}
