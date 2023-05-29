import 'package:clone/infrastructure/providers/provider_registration.dart';
import 'package:clone/screens/home_screens/common/capsule_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabCapsule extends ConsumerStatefulWidget {
  const TabCapsule({super.key});

  @override
  ConsumerState<TabCapsule> createState() => _TabCapsuleState();
}

class _TabCapsuleState extends ConsumerState<TabCapsule> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          for (var i = 0; i < data.length; i++)
            CapsuleButton(
                title: data[i],
                total: '8',
                isSelected: isSelected == i,
                onTap: () {
                  setState(() {
                    isSelected = i;
                  });
                  ref.read(homeProvider).setFilterCapsule(data[i].toUpperCase());
                }),
          // CapsuleButton(
          //     title: "All",
          //     total: '8',
          //     isSelected: true,
          //     onTap: () {
          //       ref.read(homeProvider).setFilterCapsule("ALL");
          //     }),
          // CapsuleButton(
          //   title: "Pending",
          //   total: '8',
          //   isSelected: false,
          //   onTap: () {
          //     ref.read(homeProvider).setFilterCapsule("PENDING");
          //   },
          // ),
          // CapsuleButton(
          //   title: "In Progress",
          //   total: '8',
          //   isSelected: false,
          //   onTap: () {
          //     ref.read(homeProvider).setFilterCapsule("IN-PROGRESS");
          //   },
          // ),
        ],
      ),
    );
  }
}

var data = ["All", "Pending", "In Progress"];
