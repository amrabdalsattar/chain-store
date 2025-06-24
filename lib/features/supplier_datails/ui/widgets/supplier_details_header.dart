part of '../supplier_details_screen.dart';

class SupplierDetailsHeader extends StatelessWidget {
  final SupplierDataModel supplier;
  const SupplierDetailsHeader({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SupplierImage(imageUrl: supplier.imageUrl!),
        verticalSpace(8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '${supplier.name}',
            style: AppTextStyles.robotoBlackBold16,
          ),
        ),
        verticalSpace(4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Category : ${supplier.businessType}',
            style: AppTextStyles.robotoGrayRegular12,
          ),
        ),
      ],
    );
  }
}
