part of 'pages.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: offWhite,
        body: BlocProvider(
          create: (context) => QuantityCounterCubit(),
          child: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  // note: Padding for spacing the end of scrollview to status bar and navbar.
                  padding: const EdgeInsets.fromLTRB(0, 86, 0, 180),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          // note: Padding for spacing scrollview content with left and right side
                          padding: const EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 311,
                                decoration: BoxDecoration(
                                  color: offWhiteBackground,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: (product.picture != null)
                                    ? Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Align(
                                            alignment:
                                                const Alignment(-0.5, -1),
                                            child: Image(
                                              width: 216,
                                              height: 305,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  product.picture ?? 'null'),
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(0.65, 1),
                                            child: Image(
                                              width: 174,
                                              height: 245,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  product.picture ?? 'null'),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 80,
                                          color: blackWhite30,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  product.name,
                                  style: blackTextFont.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                product.description ?? 'No description',
                                textAlign: TextAlign.justify,
                                style: greyTextFont.copyWith(
                                  color: blackWhite30,
                                  fontSize: 12,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      defaultMargin, 16, defaultMargin, 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 46,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HeaderButton(
                              icon: IconlyLight.arrow_left_2,
                              onTap: () {
                                context.pop();
                              },
                            ),
                            Text(
                              'Product Detail',
                              style: blackTextFont.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 1.47,
                              ),
                            ),
                            const HeaderButton(icon: IconlyLight.heart),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          BlocBuilder<QuantityCounterCubit,
                              QuantityCounterState>(
                            builder: (context, counterState) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  QuantityButton(
                                    decrement: () {
                                      BlocProvider.of<QuantityCounterCubit>(
                                              context)
                                          .decrement();
                                    },
                                    increment: () {
                                      BlocProvider.of<QuantityCounterCubit>(
                                              context)
                                          .increment();
                                    },
                                    counter: counterState.counter,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      decimalDigits: 0,
                                      locale: 'id_ID',
                                      name: 'Rp ',
                                    ).format(
                                        product.price * counterState.counter),
                                    style: blackTextFont.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (2 * defaultMargin),
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: mainColor100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.5),
                                ),
                              ),
                              child: Text(
                                'Add to Cart',
                                style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.8,
                                ),
                              ),
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
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final double width, height;
  final int counter;
  final Function? increment, decrement;

  const QuantityButton(
      {super.key,
      this.width = 120,
      this.height = 48,
      this.counter = 1,
      this.increment,
      this.decrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: offWhiteBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.remove_rounded),
                  Text(
                    counter.toString(),
                    style: blackTextFont.copyWith(
                      fontSize: 13.09,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.add_rounded),
                ],
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.425,
                  height: height,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      onTap: () {
                        // note: Decrement function
                        if (decrement != null) {
                          decrement!();
                        }
                      },
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.425,
                  height: height,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      onTap: () {
                        // note: Increment function
                        if (increment != null) {
                          increment!();
                        }
                      },
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
