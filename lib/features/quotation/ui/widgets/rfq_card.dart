part of '../screens/manage_rfqs_screen.dart';

class RfqCard extends StatelessWidget {
  const RfqCard({super.key, required this.rfq, required this.index});
  final RFQModel rfq;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            context.pushNamed(
              Routes.rfqQuotationScreen,
              arguments: {
                'rfqId': rfq.id.toString(),
                'cubit': context.read<QuotationCubit>(),
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: ColorsHelper.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.description,
                            color: ColorsHelper.primaryColor,
                            size: 18.w,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'RFQ #${rfq.id}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              rfq.productName ?? 'No Product',
                              style: AppTextStyles.robotoBlackSemiBold16,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(rfq.status.name),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        rfq.status.name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: _getStatusTextColor(rfq.status.name),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Details Section
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey[200]!, width: 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RfqDetailsItem(
                            icon: Icons.format_list_numbered,
                            label: 'Quantity',
                            value: '${rfq.quantity} units',
                            color: Colors.blue,
                          ),
                          SizedBox(width: 16.w),
                          RfqDetailsItem(
                            icon: Icons.category,
                            label: 'Category',
                            value: rfq.categoryName ?? 'General',
                            color: Colors.purple,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          const RfqDetailsItem(
                            icon: Icons.access_time,
                            label: 'Created',
                            value: '2 days ago', // Replace with actual date
                            color: Colors.orange,
                          ),
                          SizedBox(width: 16.w),
                          const RfqDetailsItem(
                            icon: Icons.visibility,
                            label: 'Responses',
                            value:
                                '5 quotes', // Replace with actual responses count
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12.h),

                // Action Section
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          color: ColorsHelper.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.visibility,
                              size: 16.w,
                              color: ColorsHelper.primaryColor,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'View Quotations',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorsHelper.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.grey[600],
                        size: 18.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange[100]!;
    case 'accepted':
      return Colors.green[100]!;
    case 'rejected':
      return Colors.red[100]!;
    case 'completed':
      return Colors.blue[100]!;
    default:
      return Colors.grey[100]!;
  }
}

Color _getStatusTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange[700]!;
    case 'accepted':
      return Colors.green[700]!;
    case 'rejected':
      return Colors.red[700]!;
    case 'completed':
      return Colors.blue[700]!;
    default:
      return Colors.grey[700]!;
  }
}
