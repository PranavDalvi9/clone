import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCard extends StatelessWidget {
  final String status;
  final String pickUpLocation;
  final String pickUpDate;
  final String dropLocation;
  final String dropDate;
  final String load;
  final VoidCallback onTap;
  final String preferedVehicle;
  final String materialTye;

  const HomeCard(
      {super.key,
      required this.status,
      required this.load,
      required this.onTap,
      required this.pickUpLocation,
      required this.pickUpDate,
      required this.dropLocation,
      required this.dropDate,
      required this.preferedVehicle,
      required this.materialTye});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.only(left: 6, top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFFffffff),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 5  horizontally
                1.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Text(
                  'Price $status',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 178, 209, 234),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 1, 49, 89),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/location_icon.svg',
                      height: 26,
                    ),
                    Container(
                      color: Colors.black,
                      width: 3,
                      height: 32,
                    ),
                    Image.asset(
                      "assets/flag_icon.png",
                      height: 32,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pickUpLocation,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 44, 44, 44),
                      ),
                    ),
                    Text(
                      pickUpDate,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 118, 118, 118),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      dropLocation,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 44, 44, 44),
                      ),
                    ),
                    Text(
                      dropDate,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 118, 118, 118),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  "$load Tonne • $materialTye • $preferedVehicle",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 28, 28, 28),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset('assets/arrow right.svg'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
