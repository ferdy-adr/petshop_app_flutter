part of 'widgets.dart';

class HeaderSwitchButton extends StatelessWidget {
  final String option1, option2;
  final String selectedOption;
  final Function? onTapOption1, onTapOption2;

  const HeaderSwitchButton({
    super.key,
    required this.option1,
    required this.option2,
    required this.selectedOption,
    this.onTapOption1,
    this.onTapOption2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: offWhiteBackground,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          createItem(title: option1, onTap: onTapOption1),
          const SizedBox(width: 4),
          createItem(title: option2, onTap: onTapOption2),
        ],
      ),
    );
  }

  Expanded createItem({required String title, Function? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: (onTap == null)
            ? null
            : () {
                onTap();
              },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color:
                (selectedOption == title) ? mainColor100 : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: whiteTextFont.copyWith(
                color: (selectedOption == title) ? Colors.white : blackWhite30,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
