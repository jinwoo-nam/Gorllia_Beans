import 'package:beans_instapay/di/provider_setup.dart';
import 'package:beans_instapay/main_view_model.dart';
import 'package:beans_instapay/presentation/home/home_screen.dart';
import 'package:beans_instapay/presentation/home/overlay/overlay_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: await getProviders(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return MaterialApp(
      title: '"글과 향을 담다" - Gorilla Beans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          const HomeScreen(),
          OverlayView(
            info: state.productInfo,
          ),
        ],
      ),
    );
  }
}
