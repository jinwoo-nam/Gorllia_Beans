import 'package:beans_instapay/di/provider_setup.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/main_view_model.dart';
import 'package:beans_instapay/presentation/cart/cart_page.dart';
import 'package:beans_instapay/presentation/home/home_screen.dart';
import 'package:beans_instapay/presentation/home/overlay/overlay_view.dart';
import 'package:beans_instapay/presentation/product/detail/coffee_beans_detail_screen.dart';
import 'package:beans_instapay/presentation/product/detail/dripbag_detail_screen.dart';
import 'package:beans_instapay/presentation/product/detail/stick_coffee_detail_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics.instance.logAppOpen();
  runApp(MultiProvider(
    providers: await getProviders(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      navigatorObservers: <NavigatorObserver>[observer],
      routes: {
        '/': (context) {
          final viewModel = context.watch<MainViewModel>();
          final state = viewModel.state;

          if (state.productInfo == null) {
          } else {}
          return Stack(
            children: [
              const HomeScreen(),
              OverlayView(
                info: state.productInfo,
              ),
            ],
          );
        },
        '/detail/beans': (context) => const CoffeeBeansDetailScreen(),
        '/detail/stick': (context) => const StickCoffeeDetailScreen(),
        '/detail/dripbag': (context) => const DripBagDetailScreen(),
        '/intro/beans/': (context) => const DripBagDetailScreen(),
        '/cart': (context) => const CartPage(),
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
    required this.info,
  }) : super(key: key);

  final ProductInfo? info;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeScreen(),
        OverlayView(
          info: info,
        ),
      ],
    );
  }
}
