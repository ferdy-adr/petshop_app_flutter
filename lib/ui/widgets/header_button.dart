part of 'widgets.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  final Function? onTap;

  const HeaderButton({required this.icon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(4, 4),
            color: Colors.black.withOpacity(0.07),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            (onTap == null) ? null : onTap!();
          },
          borderRadius: BorderRadius.circular(16),
          child: Icon(
            icon,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}
