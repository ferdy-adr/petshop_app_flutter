part of 'services.dart';

class ProductServices {
  static final CollectionReference _db =
      FirebaseFirestore.instance.collection('products');

  static Future<void> updateProduct(
      {required String productID,
      required String name,
      String? shortName,
      int price = 0,
      String? picture,
      String? description}) async {
    await _db.doc().set({
      'productID': productID,
      'name': name,
      'shortName': shortName ?? '',
      'price': price,
      'picture': picture ?? '',
      'description': description ?? '',
    });
  }

  static Future<List<Product>> getProducts() async {
    QuerySnapshot snapshot = await _db.get();

    return snapshot.docs.map((item) {
      Map<String, dynamic> product = (item.data() as Map<String, dynamic>);

      return Product(
        productID: product['productID'],
        name: product['name'],
        shortName: (product['shortName'] == null || product['shortName'] == '')
            ? product['name']
            : product['shortName'],
        price: product['price'],
        picture: product['picture'],
        description: product['description'],
      );
    }).toList();
  }
}
