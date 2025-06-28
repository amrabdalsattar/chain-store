part of 'custom_tab_controller.dart';

class CustomTabBar extends StatefulWidget {
  final List<Category> categories;
  const CustomTabBar({super.key, required this.categories});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: TabBar(
        onTap: (index) {
          currentTabIndex = index;
          setState(() {});
        },
        splashFactory: NoSplash.splashFactory,
        labelColor: ColorsHelper.black,
        labelStyle: AppTextStyles.robotoBlackRegular14,
        unselectedLabelColor: ColorsHelper.black,
        indicatorWeight: 3,
        indicatorAnimation: TabIndicatorAnimation.linear,
        indicatorColor: ColorsHelper.liteBlue,
        splashBorderRadius: BorderRadius.circular(20),
        physics: const BouncingScrollPhysics(),
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
        tabs: [
          ...widget.categories.map(
            (category) => CategoryTabWidget(
              title: category.name,
              isSelected:
                  currentTabIndex == widget.categories.indexOf(category),
            ),
          ),
        ],
      ),
    );
  }
}
