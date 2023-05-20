part of 'models.dart';

class Product extends Equatable {
  final String productID, name, shortName;
  final int price;
  final String? picture;

  const Product(
      {required this.productID,
      required this.name,
      required this.shortName,
      this.price = 0,
      this.picture});

  Product copyWith(
      {String? name, String? shortName, int? price, String? picture}) {
    return Product(
        productID: productID,
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        price: price ?? this.price,
        picture: picture ?? this.picture);
  }

  @override
  List<Object?> get props => [productID, name, shortName, price, picture];
}
