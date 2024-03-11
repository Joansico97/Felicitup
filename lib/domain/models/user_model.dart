import 'package:felicitup/domain/models/models.dart';

class UserModel {
  final String? firstName;
  final String? lastName;
  final String? userEmail;
  final String? userImage;
  final DateTime? birthDate;
  final List<FelicitupModel>? felicitups;

  UserModel({
    this.firstName,
    this.lastName,
    this.birthDate,
    this.userEmail,
    this.userImage,
    this.felicitups,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? userEmail,
    String? userImage,
    DateTime? birthDate,
    List<FelicitupModel>? felicitups,
  }) =>
      UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userEmail: userEmail ?? this.userEmail,
        userImage: userImage ?? this.userImage,
        birthDate: birthDate ?? this.birthDate,
        felicitups: felicitups ?? this.felicitups,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        userEmail: json["userEmail"],
        userImage: json["userImage"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        felicitups: json["felicitups"] == null
            ? []
            : List<FelicitupModel>.from(
                json["felicitups"]!.map((x) => FelicitupModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "userEmail": userEmail,
        "userImage": userImage,
        "birthDate": birthDate?.toIso8601String(),
        "felicitups": felicitups == null
            ? []
            : List<dynamic>.from(felicitups!.map((x) => x.toJson())),
      };
}
