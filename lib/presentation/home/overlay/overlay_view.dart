import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_preview_payment_widget.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:flutter/material.dart';

class OverlayView extends StatelessWidget {
  final ProductInfo? info;

  const OverlayView({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globalKey = GlobalKey();

    return ValueListenableBuilder<bool>(
      key: globalKey,
      valueListenable: Loader.appLoader.loaderShowingNotifier,
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
