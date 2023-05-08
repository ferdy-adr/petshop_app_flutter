part of 'pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              children: [
                HomePage(),
              ],
            ),
            // createBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(items: []);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
                defaultMargin, 20, defaultMargin, 103),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: greyTextFont.copyWith(
                                  color: blackWhite30,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: blackWhite30,
                                size: 16,
                              )
                            ],
                          ),
                          Text(
                            'Jebres, Surakarta',
                            style: blackTextFont.copyWith(
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HeaderButton(icon: Icons.search),
                          const SizedBox(width: 12),
                          HeaderButton(icon: Icons.notifications_outlined),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
