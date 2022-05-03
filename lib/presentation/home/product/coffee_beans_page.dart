import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeBeansPage extends StatefulWidget {
  const CoffeeBeansPage({Key? key}) : super(key: key);

  @override
  State<CoffeeBeansPage> createState() => _CoffeeBeansPageState();
}

class _CoffeeBeansPageState extends State<CoffeeBeansPage> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    final state = viewModel.state;

    return state.coffeeBeansPageInfo != null
        ? ProductPageWidget(
            pageInfo: state.coffeeBeansPageInfo!,
            scrollController: scrollController,
          )
        : Container();
  }
}
