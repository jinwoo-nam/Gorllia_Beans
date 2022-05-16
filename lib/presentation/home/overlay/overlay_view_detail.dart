import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader_detail.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_preview_payment_widget.dart';
import 'package:flutter/material.dart';

class OverlayViewDetail extends StatelessWidget {
  final ProductInfo? info;

  const OverlayViewDetail({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: LoaderDetail.appLoader.loaderShowingNotifier,
      builder: (context, value, child) {
        if (value) {
          return ProductPreviewPaymentWidget(
            info: info!,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
