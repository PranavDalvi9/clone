import 'package:clone/infrastructure/providers/provider_registration.dart';
import 'package:clone/screens/home_screens/common/home_tabar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabbar extends ConsumerStatefulWidget {
  const HomeTabbar({super.key});

  @override
  ConsumerState<HomeTabbar> createState() => _HomeTabbarState();
}

class _HomeTabbarState extends ConsumerState<HomeTabbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeTabbarButton(
            onTap: () {
              ref.read(homeProvider).setisOngoingSelected(true);
            },
            title: "Ongoing",
            isSelected: ref.watch(homeProvider).isOngoingSelected),
        HomeTabbarButton(
            onTap: () {
              ref.read(homeProvider).setisOngoingSelected(false);
            },
            title: "Past",
            isSelected: !ref.watch(homeProvider).isOngoingSelected)
      ],
    );
  }
}
