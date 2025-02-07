class Subject {
  final int? id;
  final String name;
  final int coefficient;
  final String category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Subject({
    this.id,
    required this.name,
    required this.coefficient,
    required this.category,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'coefficient': coefficient,
      'category': category,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'],
      name: map['name'],
      coefficient: map['coefficient'],
      category: map['category'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }
}
