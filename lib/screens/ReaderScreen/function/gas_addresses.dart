import 'dart:convert';
import 'package:mrapp/utils/constant.dart';
import 'package:http/http.dart' as http;

class GasAddress {
  final String id;
  final String address;
  final String previousreading;

  const GasAddress({required this.id, required this.address,required this.previousreading});

  static GasAddress fromJson(Map<String, dynamic> json) =>
      GasAddress(id: json['id'], address: json['address'],previousreading: json['previous_reading']);
}

class GasAddress_Api {
  static Future<List<GasAddress>> getAddressSuggestions(String query) async {
    final url = Uri.parse("${apiAddress}gas_user_address.php");
    final response = await http.post(url,body: {
      "project_id":readerLoginSocietyidS
    });

    if (response.statusCode == 200) {
      print(23000);
      final List gasAddressesList = json.decode(response.body);
      // gasAddressesList_Id.clear();
      // gasAddressesList_Address.clear();

      //  gasAddressesList_Id = gasAddressesList;
      //  print(gasAddressesList_Id);

      return gasAddressesList.map((json) => GasAddress.fromJson(json))
          .where((_gasAddress) {
        // gasAddressesList_Id.add(_gasAddress.id);
        // gasAddressesList_Address.add(_gasAddress.address);

        final address_lower = _gasAddress.address.toLowerCase();
        final queryLower = query.toLowerCase();

        return address_lower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}