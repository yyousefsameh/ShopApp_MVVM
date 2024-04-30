import 'package:equatable/equatable.dart';

import 'favoirte_product.dart';

class Datum extends Equatable {
  final int? id;
  final FavoriteProdcut? product;

  const Datum({this.id, this.product});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : FavoriteProdcut.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };

  @override
  List<Object?> get props => [id, product];
}
