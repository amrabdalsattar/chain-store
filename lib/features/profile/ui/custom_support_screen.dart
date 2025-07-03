import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

import '../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../core/widgets/custom_loading_indicator.dart';

class CustomSupportScreen extends StatelessWidget {
  const CustomSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Tawk(
          directChatLink:
              'https://tawk.to/chat/68640abcde2bdb190ef43545/1iv3cjsig',
          visitor: TawkVisitor(
            name: SharedPreferencesHelper.getString(
              SharedPreferencesKeys.userName,
            ),
            email: SharedPreferencesHelper.getString(
              SharedPreferencesKeys.userEmail,
            ),
          ),
          onLoad: () {},
          onLinkTap: (String url) {},
          placeholder: const ColoredBox(
            color: Colors.white,
            child: CustomLoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
