import 'package:flutter/material.dart';
import 'package:nested_router_test/nested_delegate.dart';
import 'package:nested_router_test/root_delegate.dart';

class RootPage extends StatelessWidget {
  final int index;

  const RootPage({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nestedDelegate = NestedDelegate();
    return Scaffold(
      appBar: AppBar(
        title: Text('Root page: $index'),
        actions: [
          IconButton(
              onPressed: () {
                final router = Router.of(context);
                (router.routerDelegate as RootDelegate).increasePages();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Router(
          routerDelegate: nestedDelegate,
          backButtonDispatcher: ChildBackButtonDispatcher(Router.of(context).backButtonDispatcher!)..takePriority(),
        ),
      ),
    );
  }
}
