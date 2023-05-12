part of 'extensions.dart';

extension FirebaseUserExtension on User {
  UserAccount convertToUserAccount(
      {String name = 'No Name', String? profilePicture}) {
    return UserAccount(
      userID: uid,
      email: email!,
      name: name,
      profilePicture: profilePicture,
    );
  }

  Future<UserAccount> fromFirestore() async {
    return await UserAccountServices.getUser(uid).then(
      (value) => UserAccount(
        userID: uid,
        email: value['email'],
        name: value['name'],
        profilePicture: value['profilePicture'],
      ),
    );
  }
}
