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
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  bottomNavBarIndex = value;
                });
              },
              children: const [
                HomePage(),
                SizedBox() /* note: Cart Page dummy. */,
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
            if (value == 1) {
              // note: value 1 depends on CartPage index in pageview.
              context.pushNamed('cart_page');
            } else {
              setState(() {
                bottomNavBarIndex = value;
                mainPageController.jumpToPage(value);
              });
            }
          },
          currentIndex: bottomNavBarIndex,
          items: [
            createBottomNavBarItem(
              iconData: IconlyLight.home,
              activeIconData: IconlyBold.home,
            ),
            createBottomNavBarItem(
              iconData: IconlyLight.bag,
              activeIconData: IconlyBold.bag,
            ),
            createBottomNavBarItem(
              iconData: IconlyLight.profile,
              activeIconData: IconlyBold.profile,
            ),
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
