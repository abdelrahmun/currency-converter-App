class LanguageModel {
  final String id;
  final String title;
  final String code;
  final int isDefault;

  LanguageModel({
    required this.id,
    required this.title,
    required this.code,
    required this.isDefault,
  });

  LanguageModel copyWith({
    String? id,
    String? title,
    String? code,
    int? isDefault,
  }) =>
      LanguageModel(
        id: id ?? this.id,
        title: title ?? this.title,
        code: code ?? this.code,
        isDefault: isDefault ?? this.isDefault,
      );

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        id: json['language_id'].toString(),
        title: json['title'].toString(),
        code: json['language_code'].toString().toLowerCase(),
        isDefault: json['is_default'],
      );

  Map<String, dynamic> toJson() => {
        'language_id': id,
        'title': title,
        'language_code': code,
        'is_default': isDefault,
      };
}
