part of '../screens/new_quotation_screen.dart';

class RFQDropDownMenu extends StatelessWidget {
  const RFQDropDownMenu({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NewQuotationCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('* $title', style: AppTextStyles.robotoBlackSemiBold16),
        verticalSpace(10),
        StatefulBuilder(
          builder: (context, setState) {
            return CustomDropdownButton(
              value: cubit.selectedCategory?.toString(),
              items:
                  cubit.categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category.id.toString(),
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) {
                  cubit.selectCategory(value);
                  setState(() {}); // To update the UI
                }
              },
              hintText: 'Select Category',
              validator: (p0) {
                if (cubit.selectedCategory == null) {
                  return 'Please select a category';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }
}
