import 'package:collection/collection.dart';

class Resident {
  String? fullName;
  String? userType;
  String? ownerCnic;
  String? tenantCnic;
  String? contact;
  String? tankerLeft;

  Resident({
    this.fullName,
    this.userType,
    this.ownerCnic,
    this.tenantCnic,
    this.contact,
    this.tankerLeft,
  });

  factory Resident.fromJson(Map<dynamic, dynamic> json) => Resident(
        fullName: json['full_name'] as String?,
        userType: json['user_type'] as String?,
        ownerCnic: json['owner_cnic'] as String?,
        tenantCnic: json['tenant_cnic'] as String?,
        contact: json['contact'] as String?,
        tankerLeft: json['tanker_left'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'user_type': userType,
        'owner_cnic': ownerCnic,
        'tenant_cnic': tenantCnic,
        'contact': contact,
        'tanker_left': tankerLeft,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Resident) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      fullName.hashCode ^
      userType.hashCode ^
      ownerCnic.hashCode ^
      tenantCnic.hashCode ^
      contact.hashCode ^
      tankerLeft.hashCode;
}
