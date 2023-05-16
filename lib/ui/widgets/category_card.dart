part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final double? width;
  final String text;
  final bool isSelected;
  final Function? onTap;

  const CategoryCard(
      {super.key,
      this.width,
      required this.text,
      this.isSelected = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onTap == null)
          ? null
          : () {
              onTap!();
            },
      child: Container(
        width: width,
        height: 47,
        decoration: BoxDecoration(
          color: isSelected ? mainColor100 : offWhiteBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Text(
          text,
          style: whiteTextFont.copyWith(
            color: (isSelected) ? Colors.white : blackWhite30,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
