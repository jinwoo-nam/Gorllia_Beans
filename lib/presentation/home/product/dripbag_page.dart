import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DripBagPage extends StatefulWidget {
  const DripBagPage({Key? key}) : super(key: key);

  @override
  State<DripBagPage> createState() => _DripBagPageState();
}

class _DripBagPageState extends State<DripBagPage> {
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

    return state.dripBagPageInfo != null
        ? ProductPageWidget(
            pageInfo: state.dripBagPageInfo!,
            scrollController: scrollController,
          )
        : Container();
  }
}
