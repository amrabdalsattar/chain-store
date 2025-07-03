part of '../screens/new_quotation_screen.dart';

class RFQDetailsTextFieldWithAi extends StatelessWidget {
  const RFQDetailsTextFieldWithAi({super.key, required this.cubit});

  final NewQuotationCubit cubit;

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
        BlocBuilder<NewQuotationCubit, NewQuotationState>(
          builder: (context, state) {
            if (state is NewQuotationfillWithAiLoadingState) {
              return const SizedBox(height: 30, child: SpinningLogo());
            } else {
              return IconButton(
                icon: const Icon(Icons.auto_awesome),
                tooltip: 'Suggest with AI',
                onPressed: () async {
                  await cubit.suggestDetailsWithGemini();
                },
              );
            }
          },
        ),
      ],
    );
  }
}
