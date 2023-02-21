import 'package:collection/collection.dart';

class Passess {
  String? id;
  String? passTypeId;
  String? passEventId;
  String? visitorTypeId;
  String? passValidityId;
  String? startDate;
  String? endDate;
  String? addressId;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? passType;
  String? passEvent;
  String? visitorType;
  String? passValidity;
  String? address;

  Passess({
    this.id,
    this.passTypeId,
    this.passEventId,
    this.visitorTypeId,
    this.passValidityId,
    this.startDate,
    this.endDate,
    this.addressId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.passType,
    this.passEvent,
    this.visitorType,
    this.passValidity,
    this.address,
  });

  factory Passess.fromJson(Map<dynamic, dynamic> json) => Passess(
        id: json['id'] as String?,
        passTypeId: json['pass_type_id'] as String?,
        passEventId: json['pass_event_id'] as String?,
        visitorTypeId: json['visitor_type_id'] as String?,
        passValidityId: json['pass_validity_id'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
        addressId: json['address_id'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        passType: json['pass_type'] as String?,
        passEvent: json['pass_event'] as String?,
        visitorType: json['visitor_type'] as String?,
        passValidity: json['pass_validity'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pass_type_id': passTypeId,
        'pass_event_id': passEventId,
        'visitor_type_id': visitorTypeId,
        'pass_validity_id': passValidityId,
        'start_date': startDate,
        'end_date': endDate,
        'address_id': addressId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'pass_type': passType,
        'pass_event': passEvent,
        'visitor_type': visitorType,
        'pass_validity': passValidity,
        'address': address,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Passess) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      passTypeId.hashCode ^
      passEventId.hashCode ^
      visitorTypeId.hashCode ^
      passValidityId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      addressId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      passType.hashCode ^
      passEvent.hashCode ^
      visitorType.hashCode ^
      passValidity.hashCode ^
      address.hashCode;
}
