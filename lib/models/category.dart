class Category {
  final String? id;
  final String name;
  final String? nameEn;
  final String icon;
  final DateTime createdAt;

  Category({
    this.id,
    required this.name,
    this.nameEn,       
    required this.icon,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'], 
      icon: json['icon'] ?? '📦',
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (nameEn != null) 'name_en': nameEn,
      'icon': icon,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
