import 'package:beans_instapay/presentation/home/overlay/overlay_view_detail.dart';
import 'package:beans_instapay/presentation/product/detail/product_detail_veiw_model.dart';
import 'package:beans_instapay/presentation/product/widget/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DripBagDetailScreen extends StatelessWidget {
  const DripBagDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailViewModel>();
    final state = viewModel.state;

    return (state.dripBagDetailPageInfo != null)
        ? Stack(
          children: [
            ProductDetailPage(
                info: state.dripBagDetailPageInfo!,
              ),
            OverlayViewDetail(
              info: state.productInfo,
            ),
          ],
        )
        : const Text('data가 없습니다');
  }
}
