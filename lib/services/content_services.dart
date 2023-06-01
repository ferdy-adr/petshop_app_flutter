part of 'services.dart';

class ContentServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<Banner> getBanner() async {
    var data = await _db
        .collection('contents')
        .where('type', isEqualTo: 'home-card')
        .where('isActive', isEqualTo: true)
        .get();

    List listBanner = data.docs
        .map((e) => Banner(
              title: e.data()['title'],
              subtitle: e.data()['subtitle'],
              picture: e.data()['picture'],
            ))
        .toList();

    return listBanner.first;
  }
}
