import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_nav.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(bottomNavigationBar: const BottomNavBar(), body: child);
  }
}
