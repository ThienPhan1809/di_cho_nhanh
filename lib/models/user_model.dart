import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phoneNumber;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? phoneNumber,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, email: $email, address: $address, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.address == address &&
      other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phoneNumber.hashCode;
  }
}

class UserLocalModal {
  String role;
  String id;
  UserLocalModal({
    required this.role,
    required this.id,
  });

  UserLocalModal copyWith({
    String? role,
    String? id,
  }) {
    return UserLocalModal(
      role: role ?? this.role,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'id': id,
    };
  }

  factory UserLocalModal.fromMap(Map<String, dynamic> map) {
    return UserLocalModal(
      role: map['role'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocalModal.fromJson(String source) =>
      UserLocalModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserLocalModal(role: $role, id: $id)';
}
