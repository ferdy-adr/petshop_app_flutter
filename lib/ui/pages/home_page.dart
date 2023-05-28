part of 'pages.dart';

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
                          GestureDetector(
                            onTap: () {
                              createBottomSheet(context);
                            },
                            child: Row(
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
                ),
                const SizedBox(height: 51),
                const HomeHeaderCard(),
                const SizedBox(height: 24),

                // note: Category Section
                const HomeCategory(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> createBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.875,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE7E7E7),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: blackTextFont.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          IconlyLight.search,
                          color: blackWhite30,
                          size: 24,
                        ),
                        hintText: 'Search your Location',
                        hintStyle: greyTextFont.copyWith(
                          color: blackWhite30,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: blackWhite10,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: blackWhite10,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: blackWhite10),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                    defaultMargin, defaultMargin, defaultMargin, 0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(IconlyLight.location, size: 24),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Track your Location',
                                style: blackTextFont.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'automatically selects your current location',
                                style: greyTextFont.copyWith(
                                  color: blackWhite30,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  List<String> categories = ['Food', 'Toys', 'Accesories'];
  List<String> sortedCategories = [];
  String? isSelectedCategory;

  @override
  void initState() {
    super.initState();
    sortedCategories.addAll(categories);
    isSelectedCategory = sortedCategories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Category',
              style: blackTextFont.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.8,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View All',
                style: amberTextFont.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 47,
          child: Row(
            children: [
              Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  color: offWhiteBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        sortedCategories = sortedCategories.reversed.toList();
                      });
                    },
                    splashColor: mainColor100,
                    borderRadius: BorderRadius.circular(16),
                    child: Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: const Icon(IconlyLight.swap),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: sortedCategories.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                        right: (index != sortedCategories.length - 1) ? 12 : 0),
                    child: CategoryCard(
                      text: sortedCategories[index],
                      isSelected: sortedCategories[index] == isSelectedCategory,
                      onTap: () {
                        setState(() {
                          isSelectedCategory = sortedCategories[index];
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Best Seller',
              style: blackTextFont.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.8,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View All',
                style: amberTextFont.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder(
          future: ProductServices.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Wrap(
                  spacing: 15,
                  children: snapshot.data!
                      .map((product) => ProductCard(
                            width: (MediaQuery.of(context).size.width -
                                    (2 * defaultMargin) -
                                    15) /
                                2,
                            name: product.shortName,
                            price: product.price,
                            productPicture: product.picture,
                            onTap: () {
                              context.goNamed(
                                'product_detail_page',
                                pathParameters: {'id': product.productID},
                                extra: product,
                              );
                            },
                            addButton: () {},
                          ))
                      .toList(),
                );
              } else {
                return Center(
                  child: Text(
                    'No products found',
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w300),
                  ),
                );
              }
            } else {
              return const SpinKitCircle(
                color: mainColor100,
              );
            }
          },
        ),
      ],
    );
  }
}

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * defaultMargin),
      height: 139,
      decoration: BoxDecoration(
        color: mainColor100,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned(
              top: 34,
              left: -89,
              child: Container(
                height: 153,
                width: 153,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mainColor70.withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              left: 46,
              child: Container(
                height: 99,
                width: 99,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mainColor70.withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              top: 95,
              left: 92,
              child: Container(
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mainColor70.withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              bottom: 98,
              right: -8,
              child: Container(
                height: 69,
                width: 69,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mainColor70.withOpacity(0.4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Royal Canin\nAdult Pomeraniann',
                      style:
                          whiteTextFont.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Get an interesting promo\nhere, without conditions',
                      style: whiteTextFont.copyWith(fontSize: 12, height: 1.3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
