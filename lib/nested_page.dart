import 'package:flutter/material.dart';
import 'package:nested_router_test/nested_delegate.dart';

class NestedPage extends StatelessWidget {
  final int index;

  const NestedPage({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Page: $index'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final router = Router.of(context);
            (router.routerDelegate as NestedDelegate).increasePages();
          },
          child: const Text('Add'),
        ),
      ),
    );
  }
}
