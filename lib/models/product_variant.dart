class ProductVariant {
  String? title;
  List? items;
  int? limit;
  bool? obrigatorio;
  
  ProductVariant({
    this.title,
    this.items,
    this.limit,
    this.obrigatorio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'items': items,
      'limit': limit,
      'obrigatorio' : obrigatorio,
    };
  }

  factory ProductVariant.fromMap(Map<String, dynamic> map) {
    return ProductVariant(
      title: map['title'] != null ? map['title'] as String : null,
      items: map['items'] != null ? map['items'] as List : null,
      limit: map['limit'] != null ? map['limit'] as int : null,
      obrigatorio: map['obrigatorio'] != null ? map['obrigatorio'] as bool : null,
    );
  }
}

class ProductVariantItem {
  String? title;
  String? description;
  num? price;
  bool? active;

  ProductVariantItem({
    this.title,
    this.description,
    this.price,
    this.active,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'active': active,
    };
  }

  factory ProductVariantItem.fromMap(Map<String, dynamic> map) {
    return ProductVariantItem(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      active: map['active'] != null ? map['active'] as bool : null,
    );
  }
}