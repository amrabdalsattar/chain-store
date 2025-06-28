part of '../product_details_screen.dart';

class ProductDetailsContent extends StatelessWidget {
  final ProductDetailsResponse product;
  final int productId;

  const ProductDetailsContent({required this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return Scaffold(
      backgroundColor: ColorsHelper.white,
      appBar: AppBar(
        backgroundColor: ColorsHelper.backgroundScaffoldColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorsHelper.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: ColorsHelper.black),
            onPressed: () {},
          ),
          WishlistHeartBlocListener(productId: productId),
          horizontalSpace(16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Carousel
            ProductImageCarousel(images: product.imageUrls),

            // Product Details Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),

                  // Brand
                  ProductDetailsInfoSection(product: product),

                  verticalSpace(16),
                  // Sizes
                  // SizeSelectorSection(cubit: cubit),
                  // verticalSpace(16),
                  // Colors
                  // ColorSelectorSection(cubit: cubit),
                  // verticalSpace(16),
                  // Quantity
                  QuantitySelectorSection(cubit: cubit),
                  verticalSpace(16),
                  // Product Description Title
                  DescriptionSection(product: product),
                  verticalSpace(20),
                  // Rating and Reviews
                  RattingSection(product: product),
                  verticalSpace(24),
                ],
              ),
            ),
            // Comment Section
            const CommentSection(),
          ],
        ),
      ),
      bottomNavigationBar: ProductDetailsButtonsSection(productId: productId),
    );
  }
}
