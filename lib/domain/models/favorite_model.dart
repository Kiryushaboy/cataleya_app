class FavoriteModel {
  final String id;
  final String name;

  FavoriteModel({required this.id, required this.name});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
