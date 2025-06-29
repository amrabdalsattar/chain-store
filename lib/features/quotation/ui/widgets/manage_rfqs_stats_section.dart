part of '../screens/manage_rfqs_screen.dart';

class ManageRFQsStatsSection extends StatelessWidget {
  const ManageRFQsStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotationCubit, QuotationState>(
      builder: (context, state) {
        final rfqs = state.rfqs ?? [];
        final pendingCount =
            rfqs
                .where((rfq) => rfq.status.name.toLowerCase() == 'pending')
                .length;
        final completedCount =
            rfqs
                .where((rfq) => rfq.status.name.toLowerCase() == 'accepted')
                .length;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              RfqStatCard(
                title: 'Total RFQs',
                value: rfqs.length.toString(),
                icon: Icons.assignment,
                color: Colors.blue,
              ),
              SizedBox(width: 12.w),
              RfqStatCard(
                title: 'Pending',
                value: pendingCount.toString(),
                icon: Icons.pending,
                color: Colors.orange,
              ),
              SizedBox(width: 12.w),
              RfqStatCard(
                title: 'Completed',
                value: completedCount.toString(),
                icon: Icons.check_circle,
                color: Colors.green,
              ),
            ],
          ),
        );
      },
    );
  }
}
