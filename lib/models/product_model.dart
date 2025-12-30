class Product {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final double basePrice;
  final String imageUrl;
  final List<VariationGroup> variationGroups;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.imageUrl,
    this.variationGroups = const [],
  });

  // Calcula o preço base (sem opcionais)
  String get formattedBasePrice => "R\$ ${basePrice.toStringAsFixed(2)}";
}

class VariationGroup {
  final String id;
  final String title;       // Ex: "Escolha o Tamanho"
  final int minSelection;   // 0 = Opcional, 1 = Obrigatório
  final int maxSelection;   // 1 = Único, >1 = Múltiplo
  final List<VariationOption> options;

  VariationGroup({
    required this.id,
    required this.title,
    required this.minSelection,
    required this.maxSelection,
    required this.options,
  });

  // Helper para saber se é obrigatório na UI
  bool get isRequired => minSelection > 0;
  // Helper para saber se é seleção única (Radio) ou múltipla (Checkbox)
  bool get isSingleSelection => maxSelection == 1;
}

class VariationOption {
  final String id;
  final String name;        // Ex: "Grande", "Bacon Extra"
  final double price;       // Valor adicional. Se 0, é grátis.

  VariationOption({
    required this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory VariationOption.fromJson(Map<String, dynamic> json) {
    return VariationOption(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  String get formattedPrice => price > 0 ? "+ R\$ ${price.toStringAsFixed(2)}" : "";
}