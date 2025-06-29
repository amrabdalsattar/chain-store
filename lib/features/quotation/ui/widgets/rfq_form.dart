part of '../screens/new_quotation_screen.dart';

class RFQForm extends StatelessWidget {
  const RFQForm({super.key, required this.cubit});

  final QuotationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormFieldWithTitle(
            title: 'Product name',
            isRequired: true,
            hintText: 'Name or Keywords',
            controller: cubit.nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              } else if (AppRegex.hasSpecialCharacter(value)) {
                return 'Cant\'t Contain Special Characters';
              }
            },
          ),
          verticalSpace(16),

          const RFQDropDownMenu(title: 'Category'),
          verticalSpace(16),
          RFQDetailsTextFieldWithAi(cubit: cubit),
          verticalSpace(17),
          Text(
            'Upload attachments (optional)',
            style: AppTextStyles.robotoBlackRegular12.copyWith(
              color: ColorsHelper.darkGray,
            ),
          ),
          verticalSpace(10),
          CustomRFQImageWidget(cubit: cubit),
          verticalSpace(17),
          CustomTextFormFieldWithTitle(
            title: 'Sourcing quantity',
            hintText: 'please enter quantity',
            keyboardType: const TextInputType.numberWithOptions(),
            isRequired: true,
            suffixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              width: 80.w,
              alignment: Alignment.center,
              child: const Text('Piece/pieces'),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1, color: ColorsHelper.borderGray),
                ),
              ),
            ),
            controller: cubit.quantityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
            },
          ),
          verticalSpace(41),
          CustomCheckboxRow(
            checkboxText:
                'I agree to share my Business Card with quoted suppliers',
            isSelected: (isSelected) {
              cubit.shareBusinessCard = isSelected;
            },
          ),
          verticalSpace(8),
          CustomCheckboxRow(
            checkboxText:
                'I have read,understood and agree to abide by the Buying  Request Posting Rules',
            isSelected: (isSelected) {
              cubit.isPolicySelected = isSelected;
            },
          ),
          verticalSpace(21),
          CustomButton(
            title: 'Post your RFQ for accurate quotes',
            width: 342,
            onTap: () async {
              if (cubit.formKey.currentState!.validate()) {
                await cubit.submitQuotation();
              }
            },
          ),
          verticalSpace(25),
        ],
      ),
    );
  }
}
