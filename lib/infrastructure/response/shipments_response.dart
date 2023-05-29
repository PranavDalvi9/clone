class ShipmentsDetails {
  String? status;
  String? pickLocation;
  String? pickDate;
  String? dropLocation;
  String? dropDate;
  String? load;
  String? materialTye;
  String? preferedVehicle;
  String? orderId;

  ShipmentsDetails(
      {this.status,
      this.pickLocation,
      this.pickDate,
      this.dropLocation,
      this.dropDate,
      this.load,
      this.materialTye,
      this.preferedVehicle,
      this.orderId});

  ShipmentsDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pickLocation = json['pickLocation'];
    pickDate = json['pickDate'];
    dropLocation = json['dropLocation'];
    dropDate = json['dropDate'];
    load = json['load'];
    materialTye = json['materialTye'];
    preferedVehicle = json['preferedVehicle'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['pickLocation'] = pickLocation;
    data['pickDate'] = pickDate;
    data['dropLocation'] = dropLocation;
    data['dropDate'] = dropDate;
    data['load'] = load;
    data['materialTye'] = materialTye;
    data['preferedVehicle'] = preferedVehicle;
    data['orderId'] = orderId;
    return data;
  }
}
