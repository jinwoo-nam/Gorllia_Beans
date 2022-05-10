import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_preview_payment_widget.dart';
import 'package:flutter/material.dart';

class OverlayView extends StatelessWidget {
  final ProductInfo? info;

  const OverlayView({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
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

Widget yourOverLayWidget() {
  return Container(
    color: Colors.black.withOpacity(0.5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close_outlined),
                          onPressed: () {
                            Loader.appLoader.hideLoader();
                          },
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.error_rounded,
                      color: Colors.red,
                      size: 50,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        ValueListenableBuilder<String>(
                          builder: (context, value, child) {
                            return Text(value);
                          },
                          valueListenable:
                              Loader.appLoader.loaderTextNotifier,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
