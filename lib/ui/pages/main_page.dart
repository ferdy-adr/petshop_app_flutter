part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController mainPageController = PageController();
  int bottomNavBarIndex = 0;

  @override
  void initState() {
    super.initState();
    mainPageController = PageController(
      initialPage: bottomNavBarIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: mainPageController,
              onPageChanged: (value) {
                setState(() {
                  bottomNavBarIndex = value;
                });
              },
              children: const [
                HomePage(),
                ProfilePage(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: createBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget createBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(45),
        topRight: Radius.circular(45),
      ),
      child: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          backgroundColor: offWhiteBackground,
          onTap: (value) {
            setState(() {
              bottomNavBarIndex = value;
              mainPageController.jumpToPage(value);
            });
          },
          currentIndex: bottomNavBarIndex,
          items: [
            createBottomNavBarItem(
                iconData: IconlyLight.home, activeIconData: IconlyBold.home),
            createBottomNavBarItem(
                iconData: IconlyLight.profile,
                activeIconData: IconlyBold.profile),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  BottomNavigationBarItem createBottomNavBarItem(
      {required IconData iconData, required IconData activeIconData}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(iconData, color: blackWhite30),
          const SizedBox(height: 6),
          const Icon(null, size: 6),
        ],
      ),
      activeIcon: Column(
        children: [
          Icon(activeIconData, color: mainColor100),
          const SizedBox(height: 6),
          const Icon(Icons.circle, color: mainColor100, size: 6),
        ],
      ),
      label: '',
    );
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
                          HeaderButton(
                            icon: Icons.search,
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                          HeaderButton(
                            icon: Icons.notifications_outlined,
                            onTap: () {},
                          ),
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
