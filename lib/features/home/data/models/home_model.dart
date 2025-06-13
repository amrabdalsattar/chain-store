import 'package:connect_chain_market/features/product_details/data/models/product_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String iconPath;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
  });

  // Sample categories for demo purposes
  static List<CategoryModel> getSampleCategories() {
    return [
      const CategoryModel(
        id: '1',
        name: 'Mobile Phone',
        iconPath: 'assets/images/mobile_phone.png',
      ),
      const CategoryModel(
        id: '2',
        name: 'Electronics',
        iconPath: 'assets/images/electronics.png',
      ),
      const CategoryModel(
        id: '3',
        name: 'Sports',
        iconPath: 'assets/images/sports.png',
      ),
      const CategoryModel(
        id: '4',
        name: 'Clothes',
        iconPath: 'assets/images/clothes.png',
      ),
      const CategoryModel(
        id: '5',
        name: 'Bags',
        iconPath: 'assets/images/bags.png',
      ),
    ];
  }
}

class BannerModel {
  final String id;
  final String imageUrl;
  final String title;
  final String description;

  const BannerModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  // Sample banners for demo purposes
  static List<BannerModel> getSampleBanners() {
    return [
      const BannerModel(
        id: '1',
        imageUrl: 'assets/images/product_placeholder.png',
        title: 'Super Flash Sale',
        description: '50% Off',
      ),
      const BannerModel(
        id: '2',
        imageUrl: 'assets/images/product_placeholder.png',
        title: 'New Arrivals',
        description: 'Check out our latest products',
      ),
    ];
  }
}

class HomeModel {
  final List<CategoryModel> categories;
  final List<BannerModel> banners;
  final List<ProductModel> featuredProducts;
  final List<ProductModel> newArrivals;

  const HomeModel({
    required this.categories,
    required this.banners,
    required this.featuredProducts,
    required this.newArrivals,
  });

  // Sample home data for demo purposes
  static HomeModel getSampleHomeData() {
    return HomeModel(
      categories: CategoryModel.getSampleCategories(),
      banners: BannerModel.getSampleBanners(),
      featuredProducts: [
        ProductModel.sampleProduct(),
        ProductModel.sampleProduct(),
        ProductModel.sampleProduct(),
      ],
      newArrivals: [
        ProductModel.sampleProduct(),
        ProductModel.sampleProduct(),
        ProductModel.sampleProduct(),
      ],
    );
  }
}