import 'package:collection/collection.dart';

class Datum {
	String? id;
	String? addressId;
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

	Datum({
		this.id, 
		this.addressId, 
		this.previousReading, 
		this.currentReading, 
		this.image, 
		this.meterNumber, 
		this.amount, 
		this.paymentMethod, 
		this.gUserId, 
		this.createdAt, 
		this.updatedAt, 
		this.isConfirm, 
	});

	factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
				id: json['id'] as String?,
				addressId: json['address_id'] as String?,
				previousReading: json['previous_reading'] as String?,
				currentReading: json['current_reading'] as String?,
				image: json['image'] as String?,
				meterNumber: json['meter_number'] as dynamic,
				amount: json['amount'] as dynamic,
				paymentMethod: json['payment_method'] as dynamic,
				gUserId: json['g_user_id'] as String?,
				createdAt: json['created_at'] as String?,
				updatedAt: json['updated_at'] as dynamic,
				isConfirm: json['is_confirm'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'address_id': addressId,
				'previous_reading': previousReading,
				'current_reading': currentReading,
				'image': image,
				'meter_number': meterNumber,
				'amount': amount,
				'payment_method': paymentMethod,
				'g_user_id': gUserId,
				'created_at': createdAt,
				'updated_at': updatedAt,
				'is_confirm': isConfirm,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Datum) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			addressId.hashCode ^
			previousReading.hashCode ^
			currentReading.hashCode ^
			image.hashCode ^
			meterNumber.hashCode ^
			amount.hashCode ^
			paymentMethod.hashCode ^
			gUserId.hashCode ^
			createdAt.hashCode ^
			updatedAt.hashCode ^
			isConfirm.hashCode;
}
