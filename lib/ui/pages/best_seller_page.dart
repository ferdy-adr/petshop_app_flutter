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
                child: createProductCards(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> createProductCards(
      BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: ProductServices.productStream(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong',
              style: greyTextFont.copyWith(fontWeight: FontWeight.w300),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitCircle(
            color: mainColor100,
          );
        }

        if (snapshot.hasData) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              mainAxisExtent: 210,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              Product product = Product(
                productID: snapshot.data!.docs[index]['productID'],
                name: snapshot.data!.docs[index]['name'],
                shortName: snapshot.data!.docs[index]['shortName'],
                price: snapshot.data!.docs[index]['price'],
                description: snapshot.data!.docs[index]['description'],
                picture: snapshot.data!.docs[index]['picture'],
              );

              return ProductCard(
                name: product.shortName,
                price: product.price,
                productPicture: product.picture,
                onTap: () {
                  context.pushNamed(
                    'product_detail_page',
                    pathParameters: {'id': product.productID},
                    extra: product,
                  );
                },
                addButton: () {},
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'No products found',
              style: greyTextFont.copyWith(fontWeight: FontWeight.w300),
            ),
          );
        }
      },
    );
  }
}
