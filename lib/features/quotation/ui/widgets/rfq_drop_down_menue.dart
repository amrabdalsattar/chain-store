part of '../screens/new_quotation_screen.dart';

class RFQDropDownMenu extends StatelessWidget {
  const RFQDropDownMenu({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('* $title', style: AppTextStyles.robotoBlackSemiBold16),
        verticalSpace(10),
        BlocBuilder<QuotationCubit, QuotationState>(
          builder: (context, state) {
            return CustomDropdownButton(
              value: state.selectedCategory?.toString(),
              items:
                  state.categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category.id.toString(),
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<QuotationCubit>().selectCategory(value);
                }
              },
              hintText: 'Select Category',
              validator: (p0) {
                if (state.selectedCategory == null) {
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
