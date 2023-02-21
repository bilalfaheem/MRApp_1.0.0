import 'package:collection/collection.dart';

class Visitorhistorymodel {
  String? id;
  String? guardId;
  String? passId;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? passUserContactId;
  String? qrCode;
  String? isScan;
  String? isSms;
  String? isWhatsapp;
  String? contactName;

  Visitorhistorymodel({
    this.id,
    this.guardId,
    this.passId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.passUserContactId,
    this.qrCode,
    this.isScan,
    this.isSms,
    this.isWhatsapp,
    this.contactName,
  });

  factory Visitorhistorymodel.fromJson(Map<dynamic, dynamic> json) {
    return Visitorhistorymodel(
      id: json['id'] as String?,
      guardId: json['guard_id'] as String?,
      passId: json['pass_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
      passUserContactId: json['pass_user_contact_id'] as String?,
      qrCode: json['qr_code'] as String?,
      isScan: json['is_scan'] as String?,
      isSms: json['is_sms'] as String?,
      isWhatsapp: json['is_whatsapp'] as String?,
      contactName: json['contact_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'guard_id': guardId,
        'pass_id': passId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'pass_user_contact_id': passUserContactId,
        'qr_code': qrCode,
        'is_scan': isScan,
        'is_sms': isSms,
        'is_whatsapp': isWhatsapp,
        'contact_name': contactName,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Visitorhistorymodel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      guardId.hashCode ^
      passId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      passUserContactId.hashCode ^
      qrCode.hashCode ^
      isScan.hashCode ^
      isSms.hashCode ^
      isWhatsapp.hashCode ^
      contactName.hashCode;
}
