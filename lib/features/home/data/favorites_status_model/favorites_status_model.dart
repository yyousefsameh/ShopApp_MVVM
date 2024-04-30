class FavoritesStatusModel {
  final bool? status;
  final String? message;

  FavoritesStatusModel({this.status, this.message});

  FavoritesStatusModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?;
}
