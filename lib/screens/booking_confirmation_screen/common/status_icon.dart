import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  final String title;

  const StatusIcon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const statusArr = [
      "Pending",
      "Quoted",
      "Scheduled",
      "Complete",
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < statusArr.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 76, 76, 76),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  if (i != statusArr.length - 1)
                    Container(
                      height: 5,
                      width: 72,
                      color: const Color.fromARGB(255, 76, 76, 76),
                    ),
                ],
              ),
          ],
        ),
        Row(
          children: [
            for (var i = 0; i < statusArr.length; i++)
              Row(
                children: [
                  Text(
                    statusArr[i],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (i != statusArr.length - 1)
                    const SizedBox(
                      width: 28,
                    ),
                ],
              ),
          ],
        )
      ],
    );
  }
}
