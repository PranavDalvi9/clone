import 'package:clone/infrastructure/response/shipments_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends ChangeNotifier {
  late ChangeNotifierProviderRef<HomeProvider> ref;
  HomeProvider(this.ref);

  ShipmentsDetails? selectedShipment;
  bool isOngoingSelected = true;
  String filterCapsule = "ALL";

  List<ShipmentsDetails>? shipmentsPendingData;
  List<ShipmentsDetails>? shipmentsInProgressData;

  setShipmentsPendingData(List<ShipmentsDetails> value) {
    shipmentsPendingData = value;
    // notifyListeners();
  }

  setShipmentsInProgressData(List<ShipmentsDetails> value) {
    shipmentsInProgressData = value;
  }

  setFilterCapsule(String value) {
    filterCapsule = value;
    notifyListeners();
  }

  setisOngoingSelected(bool value) {
    isOngoingSelected = value;
    notifyListeners();
  }

  setSelectedShipmentDetails(ShipmentsDetails value) {
    selectedShipment = value;
    notifyListeners();
  }
}
