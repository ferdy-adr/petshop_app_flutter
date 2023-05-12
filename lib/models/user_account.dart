part of 'models.dart';

class UserAccount extends Equatable {
  final String userID, email, name;
  final String? profilePicture;

  const UserAccount(
      {required this.userID,
      required this.email,
      required this.name,
      this.profilePicture});

  UserAccount copyWith({String? name, String? profilePicture}) {
    return UserAccount(
      userID: userID,
      email: email,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  List<Object?> get props => [userID, email, name, profilePicture];
}
