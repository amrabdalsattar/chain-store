import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/basic_app_bar.dart';
import 'widgets/about_us_content.dart';
import 'widgets/about_us_illustration.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: ''),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 34.w),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [AboutUsIllustration(), AboutUsContent()],
          ),
        ),
      ),
    );
  }
}
