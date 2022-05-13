import 'package:beans_instapay/di/provider_setup.dart';
import 'package:beans_instapay/main_state.dart';
import 'package:beans_instapay/main_view_model.dart';
import 'package:beans_instapay/presentation/home/home_screen.dart';
import 'package:beans_instapay/presentation/home/overlay/overlay_view.dart';
import 'package:beans_instapay/presentation/product/coffee_beans_detail_screen.dart';
import 'package:beans_instapay/presentation/product/dripbag_detail_screen.dart';
import 'package:beans_instapay/presentation/product/stick_coffee_detail_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(state: state,),
        '/detail/beans' : (context) => const CoffeeBeansDetailScreen(),
        '/detail/stick' : (context) => const StickCoffeeDetailScreen(),
        '/detail/dripbag' : (context) => const DripBagDetailScreen(),
      },
      title: '"글과 향을 담다" - Gorilla Beans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MainScreen(state: state),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  final MainState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeScreen(),
        OverlayView(
          info: state.productInfo,
        ),
      ],
    );
  }
}
