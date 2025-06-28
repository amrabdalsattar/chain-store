part of 'custom_tab_controller.dart';

class CustomTabBarView extends StatelessWidget {
  final List<Category> categories;
  const CustomTabBarView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      dragStartBehavior: DragStartBehavior.down,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...categories.map(
          (category) => CategoryProductsBlocBuilder(categoryId: category.id),
        ),
      ],
    );
  }
}
