import 'package:clone/infrastructure/providers/provider_registration.dart';
import 'package:clone/infrastructure/response/shipments_response.dart';
import 'package:clone/screens/booking_confirmation_screen/booking_confirmation_screen.dart';
import 'package:clone/screens/home_screens/common/home_card.dart';
import 'package:clone/screens/home_screens/common/home_tabbar.dart';
import 'package:clone/screens/home_screens/common/tabs_capsule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    filterData() {
      List<ShipmentsDetails> filteredData = shipmentsData.where((item) => item.status == "Pending").toList();
      ref.read(homeProvider).setShipmentsPendingData(filteredData);

      List<ShipmentsDetails> filteredDataInProgress = shipmentsData.where((item) => item.status == "In Progress").toList();
      ref.read(homeProvider).setShipmentsInProgressData(filteredDataInProgress);
    }

    filterData();

    final homeProviderRead = ref.read(homeProvider);
    final homeProviderWatch = ref.watch(homeProvider);

    final mappingData = ref.watch(homeProvider).filterCapsule == "ALL"
        ? shipmentsData
        : ref.watch(homeProvider).filterCapsule == "PENDING"
            ? ref.watch(homeProvider).shipmentsPendingData
            : ref.watch(homeProvider).shipmentsInProgressData;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              "My Loads",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 24),
          const HomeTabbar(),
          if (homeProviderWatch.isOngoingSelected) const TabCapsule(),
          if (homeProviderWatch.isOngoingSelected)
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: mappingData?.length ?? 0,
                  itemBuilder: (context, index) {
                    ShipmentsDetails dataToMap = mappingData![index];
                    return HomeCard(
                      onTap: () {
                        homeProviderRead.setSelectedShipmentDetails(mappingData[index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookaingConfirmationScreen()),
                        );
                      },
                      status: dataToMap.status ?? '',
                      pickUpLocation: dataToMap.pickLocation ?? '',
                      pickUpDate: dataToMap.pickDate ?? '',
                      dropLocation: dataToMap.dropLocation ?? '',
                      dropDate: dataToMap.dropDate ?? '',
                      load: dataToMap.load ?? '',
                      materialTye: dataToMap.materialTye ?? '',
                      preferedVehicle: dataToMap.preferedVehicle ?? '',
                    );
                  }),
            ),
        ],
      ),
    );
  }
}

List data = [
  {
    "status": "Pending",
    "pickLocation": "Mumbai, Maharashtra",
    "pickDate": "08-Mar-2023",
    "dropLocation": "Banglore, Karnatak",
    "dropDate": "13-Mar-2023",
    "load": "5",
    "materialTye": "TMT",
    "preferedVehicle": "Open Full Body Truck",
    "orderId": "91"
  },
  {
    "status": "In Progress",
    "pickLocation": "Mumbai, Maharashtra",
    "pickDate": "08-Mar-2023",
    "dropLocation": "Banglore, Karnatak",
    "dropDate": "13-Mar-2023",
    "load": "10",
    "materialTye": "TMT",
    "preferedVehicle": "Open Full Body Truck",
    "orderId": "95"
  },
  {
    "status": "Pending",
    "pickLocation": "Durgapur, West Bengal",
    "pickDate": "08-Mar-2023",
    "dropLocation": "Barpeta, Assam",
    "dropDate": "To be determined",
    "load": "30",
    "materialTye": "TMT",
    "preferedVehicle": "Open Full Body Truck",
    "orderId": "92"
  },
  {
    "status": "Pending",
    "pickLocation": "Durgapur, West Bengal",
    "pickDate": "08-Mar-2023",
    "dropLocation": "Patshala, Assam",
    "dropDate": "To be determined",
    "load": "15",
    "materialTye": "TMT",
    "preferedVehicle": "Open Full Body Truck",
    "orderId": "93"
  },
  {
    "status": "Pending",
    "pickLocation": "Durgapur, West Bengal",
    "pickDate": "08-Mar-2023",
    "dropLocation": "Bahari, Assam",
    "dropDate": "To be determined",
    "load": "15",
    "materialTye": "TMT",
    "preferedVehicle": "Open Full Body Truck",
    "orderId": "94"
  },
];

List<ShipmentsDetails> shipmentsData = data.map((e) => ShipmentsDetails.fromJson(e)).toList();
//  [
//   ShipmentsDetails.fromJson({
//     "status": "Pending",
//     "pickLocation": "Mumbai, Maharashtra",
//     "pickDate": "08-Mar-2023",
//     "dropLocation": "Banglore, Karnatak",
//     "dropDate": "13-Mar-2023",
//     "load": "10",
//     "materialTye": "TMT",
//     "preferedVehicle": "Open Full Body Truck",
//   }),

//   {
//     "status": "Pending",
//     "pickLocation": "Mumbai, Maharashtra",
//     "pickDate": "08-Mar-2023",
//     "dropLocation": "Banglore, Karnatak",
//     "dropDate": "13-Mar-2023",
//     "load": "10",
//     "materialTye": "TMT",
//     "preferedVehicle": "Open Full Body Truck",
//   }
// ];
