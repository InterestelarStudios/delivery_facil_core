// lib/models/order_enums.dart

enum OrderStatus {
  pending,          // A aguardar confirmação da loja
  confirmed,        // Loja aceitou
  preparing,        // Em preparação na cozinha
  readyForPickup,   // Pronto para o estafeta/motoboy
  outForDelivery,   // Saiu para entrega
  delivered,        // Entregue ao cliente
  canceled,         // Cancelado
  rejected          // Rejeitado pela loja
}

enum PaymentMethod {
  creditCard,
  debitCard,
  pix,
  cash,
  online // Pagamento já realizado via gateway no app
}