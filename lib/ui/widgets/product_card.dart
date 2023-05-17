part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final double width, height, price;
  final String name;
  final String? productPicture;
  final Function? onTap, addButton;

  const ProductCard(
      {super.key,
      this.width = 156,
      this.height = 210,
      required this.name,
      this.price = 0,
      this.productPicture,
      this.onTap,
      this.addButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: offWhiteBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 0),
            child: GestureDetector(
              onTap: (onTap == null)
                  ? null
                  : () {
                      onTap!();
                    },
              child: (productPicture != null)
                  ? Image(
                      image: NetworkImage(productPicture!),
                      fit: BoxFit.cover,
                      width: width - (2 * 7),
                      height: width - (2 * 7),
                    )
                  : SizedBox(
                      width: width - (2 * 7),
                      height: width - (2 * 7),
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: blackWhite30,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width - 24 - 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: blackTextFont.copyWith(
                          color: blackWhite90,
                          fontSize: 12,
                          height: 1.6,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Text(
                              NumberFormat.currency(
                                decimalDigits: 0,
                                locale: 'id_ID',
                                name: 'Rp ',
                              ).format(price),
                              style: blackTextFont.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: (addButton == null)
                        ? null
                        : () {
                            addButton!();
                          },
                    elevation: 0,
                    backgroundColor: mainColor100,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
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
