part of '../screens/new_quotation_screen.dart';


class RFQDetailsTextFieldWithAi extends StatelessWidget {
  const RFQDetailsTextFieldWithAi({
    super.key,
    required this.cubit,
  });

  final QuotationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextFormFieldWithTitle(
            title: 'Detailed requirements',
            hintText: 'I am looking for...',
            maxlines: 5,
            isRequired: true,
            controller: cubit.detailsController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
            },
          ),
        ),
        horizontalSpace(8),
        BlocBuilder<QuotationCubit, QuotationState>(
          builder: (context, state) {
            return IconButton(
              icon:
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : const Icon(
                        Icons.auto_fix_high,
                        color: Colors.blue,
                      ),
              tooltip: 'Suggest with AI',
              onPressed:
                  state.isLoading
                      ? null
                      : () async {
                        await cubit.suggestDetailsWithGemini();
                      },
            );
          },
        ),
      ],
    );
  }
}
