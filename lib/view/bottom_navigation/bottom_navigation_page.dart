// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/view/bottom_navigation/widgets/bottom_navigation_items.dart';
import 'package:metidation_app/viewmodels/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../core/constants/app_colors.dart';
import '../../core/helpers/session_manager.dart';
import '../../viewmodels/bottom_navigation/back_press_view_model.dart';

class BottomNavigationPage extends HookConsumerWidget {
  final Widget child;
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavigationViewModelProvider);
    final viewModel = ref.read(bottomNavigationViewModelProvider.notifier);
    final backPressViewModel = ref.read(backPressViewModelProvider.notifier);

    final controller =
        useMemoized(() => PersistentTabController(initialIndex: index), []);
    final location = GoRouterState.of(context).uri.path;

    // Sync tab index with route AFTER build
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final routes = ['/home', '/sleep', '/meditate', '/music', '/profile'];
        final currentIndex = routes.indexWhere((r) => location.startsWith(r));
        if (currentIndex != -1 && currentIndex != index) {
          viewModel.setIndex(currentIndex);
          controller.jumpToTab(currentIndex); // ⬅️ Tambahkan ini
        }
      });
      return null;
    }, [location]);

    final routes = ['/home', '/sleep', '/meditate', '/music', '/profile'];

    Color getNavBarColor(int i) =>
        i == 1 ? AppColors.navigationSleep : Colors.white;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        backPressViewModel.shouldExitNow((shouldExit) {
          if (!shouldExit) {
            Fluttertoast.showToast(msg: "Klik 2x untuk keluar dari aplikasi");
          } else {
            context.pop();
          }
        });
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PersistentTabView(
            context,
            controller: controller,
            screens: List.generate(5, (i) => i == index ? child : Container()),
            items: buildNavbarItems(index),
            onItemSelected: (index) async {
              viewModel.setIndex(index);
              if (index == 1) {
                final hasSleep = await SessionManager.hasSleep();
                if (!hasSleep) {
                  context.go('/welcome-sleep');
                  return;
                }
              }
              context.go(routes[index]);
            },
            navBarStyle: NavBarStyle.style3,
            backgroundColor: getNavBarColor(index),
            confineToSafeArea: true,
            decoration: NavBarDecoration(
              colorBehindNavBar: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38.withValues(),
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
