part of '../screens/manage_rfqs_screen.dart';

class ManageRFQsListSection extends StatelessWidget {
  const ManageRFQsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<QuotationCubit, QuotationState>(
        builder: (context, state) {
          final rfqs = state.rfqs ?? [];
          if (state.isLoading && state.rfqState == RFQState.manageRFQState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomLoadingIndicator(),
                  verticalSpace(16),
                  Text(
                    'Loading your RFQs...',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
                  ),
                ],
              ),
            );
          }
          if (rfqs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.assignment_outlined,
                      size: 48.w,
                      color: const Color(0xFFBDBDBD),
                    ),
                  ),
                  verticalSpace(16),
                  Text(
                    'No RFQs Found',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  verticalSpace(8.h),
                  Text(
                    'You haven\'t created any RFQs yet',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                  ),
                  verticalSpace(24.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to create RFQ screen
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Create New RFQ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsHelper.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: rfqs.length,
            separatorBuilder: (_, __) => verticalSpace(12.h),
            itemBuilder: (context, index) {
              final rfq = rfqs[index];
              return RfqCard(rfq: rfq, index: index);
            },
          );
        },
      ),
    );
  }
}
