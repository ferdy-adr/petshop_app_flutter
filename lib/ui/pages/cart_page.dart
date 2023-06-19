part of 'pages.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // note: To previous page function
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        defaultMargin, 16, defaultMargin, 12),
                    child: createHeader(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox createHeader() {
    return SizedBox(
      height: 46,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Cart',
              style: blackTextFont.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.47,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: HeaderButton(
              icon: IconlyLight.arrow_left_2,
              onTap: () {
                // note: To previous page function
              },
            ),
          ),
        ],
      ),
    );
  }
}
