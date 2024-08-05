import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/allRoutes.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: isIOS ? 20 : 12,
        left: 16,
        right: 16,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavBarItem(
            iconUrl: Icons.home,
            title: 'home',
            isActive: location == '/home',
            onTap: () {
              context.goNamed(AppRoute.home.name);
            },
          ),
          BottomNavBarItem(
            iconUrl: Icons.mood,
            title: 'mood',
            isActive: location == '/mood',
            onTap: () {
              context.pushNamed(AppRoute.mood.name);
            },
          ),
          BottomNavBarItem(
            iconUrl: Icons.height,
            title: 'Height',
            isActive: location == '/height',
            onTap: () {
              context.pushNamed(AppRoute.height.name);
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.isActive,
    this.onTap,
  });

  final IconData iconUrl;
  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? null : onTap,
      child: Container(
        width: 88,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Icon(
                iconUrl,
                color: isActive ? Colors.blue : const Color(0xff676F6E),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
