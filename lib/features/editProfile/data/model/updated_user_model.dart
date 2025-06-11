class UpdatedUserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  UpdatedUserModel({this.firstName, this.lastName, this.email, this.phone});

  factory UpdatedUserModel.fromJson(Map<String, dynamic> json) {
    return UpdatedUserModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }
}
