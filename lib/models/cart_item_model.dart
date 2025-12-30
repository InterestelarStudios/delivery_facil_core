// lib/models/cart_item_model.dart

import 'package:delivery_facil_core/models/product_model.dart';

class CartItem {
  final String id;
  final String productId;
  final String productName;
  final double basePrice; // Preço no momento da compra
  int quantity;
  final List<VariationOption> selectedOptions;
  String? observation;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.basePrice,
    this.quantity = 1,
    this.selectedOptions = const [],
    this.observation,
  });

  double get totalItemPrice {
    double optionsTotal = selectedOptions.fold(0, (sum, option) => sum + option.price);
    return (basePrice + optionsTotal) * quantity;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'basePrice': basePrice,
      'quantity': quantity,
      'observation': observation,
      'selectedOptions': selectedOptions.map((opt) => opt.toJson()).toList(),
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      productName: json['productName'],
      basePrice: (json['basePrice'] as num).toDouble(),
      quantity: json['quantity'],
      observation: json['observation'],
      selectedOptions: (json['selectedOptions'] as List)
          .map((opt) => VariationOption.fromJson(opt))
          .toList(),
    );
  }
}