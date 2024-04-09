class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? userImg;
  String? email;
  DateTime? birthDate;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.userImg,
    this.email,
    this.birthDate,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? userImg,
    String? email,
    DateTime? birthDate,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        userImg: userImg ?? this.userImg,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        userImg: json["userImg"],
        email: json["email"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "userImg": userImg,
        "email": email,
        "birthDate": birthDate?.toIso8601String(),
      };
}
