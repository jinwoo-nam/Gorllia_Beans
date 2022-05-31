import 'package:beans_instapay/data/repository/api_test_repository_impl.dart';
import 'package:beans_instapay/data/repository/cart_repository_impl.dart';
import 'package:beans_instapay/data/repository/product_detail_info_repository_impl.dart';
import 'package:beans_instapay/data/repository/product_info_repository_impl.dart';
import 'package:beans_instapay/domain/repository/api_test_repository.dart';
import 'package:beans_instapay/domain/use_case/api_test_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/add_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/delete_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/get_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/cart/update_cart_data_use_case.dart';
import 'package:beans_instapay/domain/use_case/details/get_coffee_beans_detail_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/details/get_drip_bag_detail_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/details/get_stick_coffee_detail_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_coffee_beans_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_drip_bag_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_stick_coffee_info_use_case.dart';
import 'package:beans_instapay/main_view_model.dart';
import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/components/temp/notice_sample_view_model.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/product/detail/product_detail_veiw_model.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final repository = ProductInfoRepositoryImpl();
  final detailProductRepository = ProductDetailInfoRepositoryImpl();
  final cartRepository = CartRepositoryImpl();

  List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<ProductViewModel>(
      create: (context) => ProductViewModel(
        getDripBagInfo: GetDripBagInfoUseCase(repository),
        getStickCoffeeInfo: GetStickCoffeeInfoUseCase(repository),
        getCoffeeBeansInfo: GetCoffeeBeansInfoUseCase(repository),
      ),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
    ),
    ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
    ),
    ChangeNotifierProvider<ProductIntroViewModel>(
      create: (context) => ProductIntroViewModel(),
    ),
    ChangeNotifierProvider<CartViewModel>(
      create: (context) => CartViewModel(
        getCartData: GetCartDataUseCase(cartRepository),
        addCartData: AddCartDataUseCase(cartRepository),
        deleteCartData: DeleteCartDataUseCase(cartRepository),
        updateCartData: UpdateCartDataUseCase(cartRepository),
      ),
    ),
    ChangeNotifierProvider<ProductDetailViewModel>(
      create: (context) => ProductDetailViewModel(
        getDripBagDetail: GetDripBagDetailInfoUseCase(detailProductRepository),
        getStickCoffeeDetail:
            GetStickCoffeeDetailInfoUseCase(detailProductRepository),
        getCoffeeBeansDetail:
            GetCoffeeBeansDetailInfoUseCase(detailProductRepository),
      ),
    ),

    ChangeNotifierProvider<NoticeSampleViewModel>(
      create: (context) => NoticeSampleViewModel(
          ApiTestUseCase(ApiTestRepositoryImpl()),
      ),
    ),
  ];

  return viewModels;
}
