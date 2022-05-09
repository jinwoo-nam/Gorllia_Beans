import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPreviewPaymentWidget extends StatelessWidget {
  final ProductInfo info;

  const ProductPreviewPaymentWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double originalPrice = 10000; //double.parse(info.price) * 1.1;

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.close_outlined),
                            onPressed: () {
                              Loader.appLoader.hideLoader();
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            info.name,
                            style: GoogleFonts.notoSans(
                              fontSize: 20,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('결제 금액'),
                                        Text('15,000')
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('결제 금액'),
                                        Text('15,000')
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('결제 금액'),
                                        Text('15,000')
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('결제 금액'),
                                        Text('15,000')
                                      ]),
                                  DropdownButton(
                                    value: '1',
                                    items: ['1', '2', '3', '5', '10'].map(
                                      (value) {
                                        return DropdownMenuItem(
                                            child: Text(value), value: value);
                                      },
                                    ).toList(),
                                    onChanged: (value) {},
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Image(
                              image: AssetImage(info.qrImage_1),
                              fit: BoxFit.cover,
                              width: 180,
                              height: 180,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            Text(info.description),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Column(
    //   children: [
    //     ElevatedButton(
    //       onPressed: () {
    //         Loader.appLoader.hideLoader();
    //       },
    //       child: Icon(Icons.close),
    //     ),
    //     Expanded(
    //       child: Container(
    //         color: Colors.black.withOpacity(0.5),
    //         child: Center(
    //           child: Column(
    //             children: [
    //               Text(info.name),
    //               Row(
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Text('결제금액'),
    //                           Text(info.price),
    //                         ],
    //                       ),
    //                       const Divider(),
    //                       Row(
    //                         children: [
    //                           Text('정가'),
    //                           Text('$originalPrice'),
    //                         ],
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text('할인가'),
    //                           Column(
    //                             children: [
    //                               Text(info.price),
    //                               Text('(10% 할인)'),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                       Row(
    //                         children: const [
    //                           Text('배송비'),
    //                           Text('2,000원'),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   Image(
    //                     image: AssetImage(info.qrImage_1),
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
