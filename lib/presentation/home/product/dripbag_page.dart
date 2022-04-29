import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DripBagPage extends StatelessWidget {
  const DripBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    final state = viewModel.state;

    return state.dripBagPageInfo != null
        ? ProductPageWidget(pageInfo: state.dripBagPageInfo!)
        : const CircularProgressIndicator();
  }
}
