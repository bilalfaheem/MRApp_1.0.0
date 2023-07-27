
class HistoryDataModel {
  String? date;
  List<Data>? data;

  HistoryDataModel({this.date, this.data});

  HistoryDataModel.fromJson(Map<dynamic, dynamic> json) {
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? addressId;
  String? address;
  String? previousReading;
  String? currentReading;
  String? image;
  dynamic meterNumber;
  dynamic amount;
  dynamic paymentMethod;
  String? gUserId;
  String? createdAt;
  dynamic updatedAt;
  String? isConfirm;

  Data({this.id, this.addressId, this.address, this.previousReading, this.currentReading, this.image, this.meterNumber, this.amount, this.paymentMethod, this.gUserId, this.createdAt, this.updatedAt, this.isConfirm});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["address_id"] is String) {
      addressId = json["address_id"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["previous_reading"] is String) {
      previousReading = json["previous_reading"];
    }
    if(json["current_reading"] is String) {
      currentReading = json["current_reading"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    meterNumber = json["meter_number"];
    amount = json["amount"];
    paymentMethod = json["payment_method"];
    if(json["g_user_id"] is String) {
      gUserId = json["g_user_id"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    updatedAt = json["updated_at"];
    if(json["is_confirm"] is String) {
      isConfirm = json["is_confirm"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["address_id"] = addressId;
    _data["address"] = address;
    _data["previous_reading"] = previousReading;
    _data["current_reading"] = currentReading;
    _data["image"] = image;
    _data["meter_number"] = meterNumber;
    _data["amount"] = amount;
    _data["payment_method"] = paymentMethod;
    _data["g_user_id"] = gUserId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["is_confirm"] = isConfirm;
    return _data;
  }
}