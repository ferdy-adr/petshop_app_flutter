part of 'services.dart';

class UserAccountServices {
  static final CollectionReference _db =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserAccount user) async {
    await _db.doc(user.userID).set({
      'email': user.email,
      'name': user.name,
      'profilePicture': user.profilePicture ?? ''
    });
  }

  static Future<Map<String, dynamic>> getUser(String userID) async {
    return await _db
        .doc(userID)
        .get()
        .then((value) => value.data() as Map<String, dynamic>);
  }
}
