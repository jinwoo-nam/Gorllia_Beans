import 'package:beans_instapay/presentation/product/product_detail_veiw_model.dart';
import 'package:beans_instapay/presentation/product/widget/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StickCoffeeDetailScreen
    extends StatelessWidget {
  const StickCoffeeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailViewModel>();
    final state = viewModel.state;

    return (state.stickCoffeeDetailPageInfo != null)
        ? ProductDetailPage(
      info: state.stickCoffeeDetailPageInfo!,
    )
        : Text('data가 없습니다');
  }
}
