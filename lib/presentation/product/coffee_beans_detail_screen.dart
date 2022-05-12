import 'package:beans_instapay/presentation/product/product_detail_veiw_model.dart';
import 'package:beans_instapay/presentation/product/widget/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeBeansDetailScreen extends StatelessWidget {
  const CoffeeBeansDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailViewModel>();
    final state = viewModel.state;

    return (state.coffeeBeansDetailPageInfo != null)
        ? ProductDetailPage(
            info: state.coffeeBeansDetailPageInfo!,
          )
        : Text('data가 없습니다');
  }
}
