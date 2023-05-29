import 'package:clone/infrastructure/providers/provider_registration.dart';
import 'package:clone/screens/booking_confirmation_screen/common/row_two_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailCard extends ConsumerStatefulWidget {
  const DetailCard({super.key});

  @override
  ConsumerState<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends ConsumerState<DetailCard> {
  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pickup Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
                  ),
                  Text(
                    homeProviderWatch.selectedShipment?.pickLocation ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 22, 22, 22),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Drop Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
                  ),
                  Text(
                    homeProviderWatch.selectedShipment?.dropLocation ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 22, 22, 22),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/truck_icon.png',
                width: 140,
              )
            ],
          ),
          const SizedBox(height: 20),
          RowTwoText(title: "Order Id", value: homeProviderWatch.selectedShipment?.orderId ?? ''),
          RowTwoText(title: "Pickup Date", value: homeProviderWatch.selectedShipment?.pickDate ?? ''),
          RowTwoText(title: "Preferred Vehicle", value: homeProviderWatch.selectedShipment?.preferedVehicle ?? ''),
          RowTwoText(title: "Quantity of load", value: "${homeProviderWatch.selectedShipment?.load ?? ''} Tonne"),
          RowTwoText(title: "Material Type", value: homeProviderWatch.selectedShipment?.materialTye ?? ''),
        ],
      ),
    );
  }
}
