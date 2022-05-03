import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_page_widget.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StickCoffeePage extends StatefulWidget {
  const StickCoffeePage({Key? key}) : super(key: key);

  @override
  State<StickCoffeePage> createState() => _StickCoffeePageState();
}

class _StickCoffeePageState extends State<StickCoffeePage> {
  final scrollController = CarouselController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    final state = viewModel.state;

    return state.stickCoffeePageInfo != null
        ? ProductPageWidget(
            pageInfo: state.stickCoffeePageInfo!,
            scrollController: scrollController,
          )
        : Container();
  }
}
