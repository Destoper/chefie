class Ingredient {
  final String? id;
  final String name;
  final String? nameEn;
  final double quantity;
  final String unit;
  final String? categoryId;
  final DateTime createdAt;

  Ingredient({
    this.id,
    required this.name,
    this.nameEn,
    required this.quantity,
    required this.unit,
    this.categoryId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'],
      categoryId: json['category_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'name_en': nameEn,
      'quantity': quantity,
      'unit': unit,
      if (categoryId != null) 'category_id': categoryId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  Ingredient copyWith({
    String? id,
    String? name,
    String? nameEn,
    double? quantity,
    String? unit,
    String? categoryId,
    DateTime? createdAt,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}