part of 'pages.dart';

class BestSellerPage extends StatelessWidget {
  const BestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultMargin, 16, defaultMargin, 12),
                child: SizedBox(
                  height: 46,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Best Seller',
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
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: createProductCards(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Product>> createProductCards() {
    return FutureBuilder(
      future: ProductServices.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                  defaultMargin, 12, defaultMargin, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 210,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ProductCard(
                name: snapshot.data![index].shortName,
                price: snapshot.data![index].price,
                productPicture: snapshot.data![index].picture,
                onTap: () {
                  context.pushNamed(
                    'product_detail_page',
                    pathParameters: {'id': snapshot.data![index].productID},
                    extra: snapshot.data![index],
                  );
                },
                addButton: () {},
              ),
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
          return const Center(
            child: SpinKitCircle(
              color: mainColor100,
            ),
          );
        }
      },
    );
  }
}
