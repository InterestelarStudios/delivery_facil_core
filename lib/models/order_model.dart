import 'cart_item_model.dart'; // Importar o modelo que criámos antes
import 'address_model.dart';
import 'order_enums.dart';

class Order {
  final String id;
  final String storeId;       // Para saber a qual restaurante pertence
  final String userId;        // Quem pediu
  final List<CartItem> items; // Os produtos e as suas variantes escolhidas
  
  final double subtotal;      // Soma dos produtos
  final double deliveryFee;   // Taxa de entrega
  final double totalAmount;   // Subtotal + Taxa - Descontos
  
  final Address deliveryAddress;
  final PaymentMethod paymentMethod;
  final OrderStatus status;
  
  final DateTime createdAt;
  final DateTime? estimatedDeliveryTime; // Previsão de entrega
  
  // Opcional: Para facilitar a leitura do status no UI
  // Em um app real, isto viria de ficheiros de tradução (i18n)
  String get statusText {
    switch (status) {
      case OrderStatus.pending: return "A aguardar confirmação";
      case OrderStatus.confirmed: return "Pedido aceite";
      case OrderStatus.preparing: return "A preparar";
      case OrderStatus.outForDelivery: return "Saiu para entrega";
      case OrderStatus.delivered: return "Entregue";
      case OrderStatus.canceled: return "Cancelado";
      default: return "Desconhecido";
    }
  }

  Order({
    required this.id,
    required this.storeId,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.totalAmount,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
    this.estimatedDeliveryTime,
  });

  // Exemplo de factory para API
  // lib/models/order_model.dart

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      storeId: json['storeId'],
      userId: json['userId'],
      // Agora o CartItem.fromJson(item) recebe apenas o mapa 'item'
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item)) 
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      deliveryAddress: Address.fromJson(json['deliveryAddress']),
      paymentMethod: PaymentMethod.values.firstWhere(
          (e) => e.toString() == "PaymentMethod.${json['paymentMethod']}"),
      status: OrderStatus.values.firstWhere(
          (e) => e.toString() == "OrderStatus.${json['status']}"),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}