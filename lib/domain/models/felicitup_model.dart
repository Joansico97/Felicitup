import 'package:felicitup/domain/models/models.dart';

class FelicitupModel {
  final List<Active>? active;
  final List<Active>? past;

  FelicitupModel({
    this.active,
    this.past,
  });

  FelicitupModel copyWith({
    List<Active>? active,
    List<Active>? past,
  }) =>
      FelicitupModel(
        active: active ?? this.active,
        past: past ?? this.past,
      );

  factory FelicitupModel.fromJson(Map<String, dynamic> json) => FelicitupModel(
        active: json["active"] == null
            ? []
            : List<Active>.from(json["active"]!.map((x) => Active.fromJson(x))),
        past: json["past"] == null
            ? []
            : List<Active>.from(json["past"]!.map((x) => Active.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "active": active == null
            ? []
            : List<dynamic>.from(active!.map((x) => x.toJson())),
        "past": past == null
            ? []
            : List<dynamic>.from(past!.map((x) => x.toJson())),
      };
}

class Active {
  final String? title;
  final String? description;
  final DateTime? dateCelebration;
  final List<UserModel>? participants;
  final String? reason;
  final List<ActiveOption>? activeOptions;

  Active({
    this.title,
    this.description,
    this.dateCelebration,
    this.participants,
    this.reason,
    this.activeOptions,
  });

  Active copyWith({
    String? title,
    String? description,
    DateTime? dateCelebration,
    List<UserModel>? participants,
    String? reason,
    List<ActiveOption>? activeOptions,
  }) =>
      Active(
        title: title ?? this.title,
        description: description ?? this.description,
        dateCelebration: dateCelebration ?? this.dateCelebration,
        participants: participants ?? this.participants,
        reason: reason ?? this.reason,
        activeOptions: activeOptions ?? this.activeOptions,
      );

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        title: json["title"],
        description: json["description"],
        dateCelebration: json["dateCelebration"] == null
            ? null
            : DateTime.parse(json["dateCelebration"]),
        participants: json["participants"] == null
            ? []
            : List<UserModel>.from(
                json["participants"]!.map((x) => UserModel.fromJson(x))),
        reason: json["reason"],
        activeOptions: json["activeOptions"] == null
            ? []
            : List<ActiveOption>.from(
                json["activeOptions"]!.map((x) => ActiveOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "dateCelebration": dateCelebration?.toIso8601String(),
        "participants": participants == null
            ? []
            : List<dynamic>.from(participants!.map((x) => x.toJson())),
        "reason": reason,
        "activeOptions": activeOptions == null
            ? []
            : List<dynamic>.from(activeOptions!.map((x) => x.toJson())),
      };
}

class ActiveOption {
  final bool? hasVideo;
  final bool? hasCollects;
  final bool? hasGroup;

  ActiveOption({
    this.hasVideo,
    this.hasCollects,
    this.hasGroup,
  });

  ActiveOption copyWith({
    bool? hasVideo,
    bool? hasCollects,
    bool? hasGroup,
  }) =>
      ActiveOption(
        hasVideo: hasVideo ?? this.hasVideo,
        hasCollects: hasCollects ?? this.hasCollects,
        hasGroup: hasGroup ?? this.hasGroup,
      );

  factory ActiveOption.fromJson(Map<String, dynamic> json) => ActiveOption(
        hasVideo: json["hasVideo"],
        hasCollects: json["hasCollects"],
        hasGroup: json["hasGroup"],
      );

  Map<String, dynamic> toJson() => {
        "hasVideo": hasVideo,
        "hasCollects": hasCollects,
        "hasGroup": hasGroup,
      };
}
