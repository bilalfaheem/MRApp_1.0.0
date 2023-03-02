import 'package:collection/collection.dart';

import 'guest.dart';
import 'passess.dart';
import 'resident.dart';

class Mm {
  String? id;
  String? passId;
  String? passUserContactId;
  String? qrCode;
  String? isScan;
  String? isSms;
  String? isWhatsapp;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? userType;
  Passess? passess;
  Resident? resident;
  Guest? guest;

  Mm({
    this.id,
    this.passId,
    this.passUserContactId,
    this.qrCode,
    this.isScan,
    this.isSms,
    this.isWhatsapp,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userType,
    this.passess,
    this.resident,
    this.guest,
  });

  factory Mm.fromJson(Map<String, dynamic> json) => Mm(
        id: json['id'] as String?,
        passId: json['pass_id'] as String?,
        passUserContactId: json['pass_user_contact_id'] as String?,
        qrCode: json['qr_code'] as String?,
        isScan: json['is_scan'] as String?,
        isSms: json['is_sms'] as String?,
        isWhatsapp: json['is_whatsapp'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        userType: json['user_type'] as String?,
        passess: json['passess'] == null
            ? null
            : Passess.fromJson(json['passess'] as Map<String, dynamic>),
        resident: json['resident'] == null
            ? null
            : Resident.fromJson(json['resident'] as Map<String, dynamic>),
        guest: json['guest'] == null
            ? null
            : Guest.fromJson(json['guest'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pass_id': passId,
        'pass_user_contact_id': passUserContactId,
        'qr_code': qrCode,
        'is_scan': isScan,
        'is_sms': isSms,
        'is_whatsapp': isWhatsapp,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'user_type': userType,
        'passess': passess?.toJson(),
        'resident': resident?.toJson(),
        'guest': guest?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Mm) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      passId.hashCode ^
      passUserContactId.hashCode ^
      qrCode.hashCode ^
      isScan.hashCode ^
      isSms.hashCode ^
      isWhatsapp.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      userType.hashCode ^
      passess.hashCode ^
      resident.hashCode ^
      guest.hashCode;
}
