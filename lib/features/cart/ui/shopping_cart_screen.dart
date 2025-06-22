import 'package:flutter/material.dart';

import '../../../core/widgets/basic_app_bar.dart';
import 'widgets/cart_bloc_builder.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BasicAppBar(title: 'My Cart', isFirstScreen: true),
      body: CartBlocBuilder(),
    );
  }
}
