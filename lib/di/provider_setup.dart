import 'package:beans_instapay/data/data_source/product_info_data_source.dart';
import 'package:beans_instapay/data/repository/product_info_repository_impl.dart';
import 'package:beans_instapay/domain/use_case/get_drip_bag_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_stick_coffee_info_use_case.dart';
import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final repository = ProductInfoRepositoryImpl();

  List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<ProductViewModel>(
      create: (context) => ProductViewModel(
        getDripBagInfo: GetDripBagInfoUseCase(repository),
        getStickCoffeeInfo: GetStickCoffeeInfoUseCase(repository),
      ),
    ),
  ];

  return viewModels;
}
