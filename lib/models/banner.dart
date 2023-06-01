part of 'models.dart';

class Banner extends Equatable {
  final String title, subtitle;
  final String? picture;

  const Banner({
    required this.title,
    required this.subtitle,
    this.picture,
  });

  @override
  List<Object?> get props => [title, subtitle, picture];
}
