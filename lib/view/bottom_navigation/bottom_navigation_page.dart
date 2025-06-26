import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/view/bottom_navigation/widgets/bottom_navigation_items.dart';
import 'package:metidation_app/viewmodels/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../viewmodels/bottom_navigation/back_press_view_model.dart';

class BottomNavigationPage extends HookConsumerWidget {
  final Widget child;
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PersistentTabController(
      initialIndex: ref.watch(bottomNavigationViewModelProvider),
    );
    final viewModel = ref.read(bottomNavigationViewModelProvider.notifier);
    final backPressViewModel = ref.read(backPressViewModelProvider.notifier);

    final routes = ['/home', '/music', '/meditate', '/sleep', '/profile'];

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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PersistentTabView(
          context,
          controller: controller,
          screens: [
            child, // Aktif route dari ShellRoute
            Container(), // Placeholder untuk tab lainnya
            Container(), // Placeholder untuk tab lainnya
            Container(), // Placeholder untuk tab lainnya
            Container(), // Placeholder untuk tab lainnya
          ],
          items: buildNavbarItems(),
          onItemSelected: (index) {
            viewModel.setIndex(index);
            context.go(routes[index]);
          },
          navBarStyle: NavBarStyle.style3,
          backgroundColor: Colors.white,
          confineToSafeArea: true,
        ),
      ),
    );
  }
}
