// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// lib/models/address_model.dart

class Address {
  final String id;
  final String street;      // Rua
  final String number;      // Número
  final String complement;  // Complemento (Apto, Bloco)
  final String district;    // Bairro
  final String city;        // Cidade
  final String zipCode;     // Código Postal / CEP
  final double latitude;    // Para cálculo do estafeta/motoboy
  final double longitude;

  Address({
    required this.id,
    required this.street,
    required this.number,
    required this.complement,
    required this.district,
    required this.city,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
  });

  // Método útil para exibir no UI em uma linha
  String get fullAddress => "$street, $number - $district";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'street': street,
      'number': number,
      'complement': complement,
      'district': district,
      'city': city,
      'zipCode': zipCode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as String,
      street: map['street'] as String,
      number: map['number'] as String,
      complement: map['complement'] as String,
      district: map['district'] as String,
      city: map['city'] as String,
      zipCode: map['zipCode'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
