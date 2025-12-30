class StoreConfig {
  final String id;
  final String name;
  final String logoUrl;
  final String primaryColorHex; // Ex: "#FF5722"
  final bool isOpen;
  final double deliveryRadiusKm;
  final double minimumOrderValue;

  StoreConfig({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.primaryColorHex,
    required this.isOpen,
    required this.deliveryRadiusKm,
    required this.minimumOrderValue,
  });

  // Construtor para converter JSON da API em Objeto
  factory StoreConfig.fromJson(Map<String, dynamic> json) {
    return StoreConfig(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      primaryColorHex: json['primaryColor'] ?? '#000000',
      isOpen: json['isOpen'] ?? false,
      deliveryRadiusKm: (json['deliveryRadiusKm'] as num).toDouble(),
      minimumOrderValue: (json['minimumOrderValue'] as num).toDouble(),
    );
  }
}