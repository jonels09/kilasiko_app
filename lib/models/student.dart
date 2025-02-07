class Student {
  final int? id;
  final String firstName;
  final String lastName;
  final String gender;
  final String className;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Student({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.className,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'className': className,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      gender: map['gender'],
      className: map['className'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }
}