import 'package:flutter/material.dart';

import '../shared_widgets/cart_app_bar.dart';
import 'widgets/empty_cart.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CartAppBar(),
      body: EmptyCart(),
    );
  }
}
