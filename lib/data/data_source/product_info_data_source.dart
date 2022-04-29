import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/domain/model/product_page_info.dart';

class ProductInfoDataSource {
  Future<Result<ProductPageInfo>> getDripBagInfo() async {
    return Result.success(dripBagPageInfo);
  }
}

ProductPageInfo dripBagPageInfo = ProductPageInfo(
  title: '드립백',
  subtitle: 'Fedora Drip bag',
  imageUrl: 'img/shop/banner/cat_dripbag_fedora.jpg',
  productInfo: dripBagProductInfo,
);

List<ProductInfo> dripBagProductInfo = [
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagSL.jpg',
    name: '고릴라빈즈 드립백 셀렉션 10개입',
    description:
        '고릴라 빈즈의 최고급 드립백 5종을 골고루 맛볼 수 있는 종합 세트\n에티오피아 예가체프, 과테말라 안티구아, 케냐AA, 코스타리카 따라주, 콜롬비아 수프리모의 5종으로 구성되어 있습니다.',
    cupNote: '각각의 특성에 따름',
    price: '13,500원',
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagEY.jpg',
    name: '에티오피아 예가체프 G2 드립백 10개입',
    description:
        '에티오피아 남부의 고급커피 생산 지역으로 가벼운 바디감으로 부드럽고 꽃내음과 같은 향이 특징\n강한 프로랄향과 레드와인과 같은 깊은 풍미가 특징이며 레몬의 산미와 화이트 초콜릿의 고급스러운 맛을 느낄 수 있습니다.',
    cupNote: '레몬 꽃 레드와인',
    price: '13,500원',
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagGA.jpg',
    name: '과테말라 안티구아 드립백 10개입',
    description:
        '비옥한 화산토, 일정한 일교차, 낮은 습도 등의 기후 조건을 가진 과테말라 안티구아(Antigua) 지역의 커피\n사탕수수, 코코아, 레몬맛의 산미가 특징이며 다크로스트에서 강한 스모크향과 품질 좋은 시가향을 느낄 수 있습니다.',
    cupNote: '살구 구운아몬드 다크초콜릿',
    price: '13,500원',
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagCT.jpg',
    name: '코스타리카 따라주 SHB 드립백 10개입',
    description:
        '커피재배의 최적의 환경을 갖춘 풍요로운 해안의 나라에서 재배한 원두\n고소함, 달콤함, 부드러운 산미, 약간의 꽃향기, 약한 바디감이 조화로워 좋은 밸런스의 커피를 느낄 수 있습니다.',
    cupNote: '라임 볶은땅콩 초콜릿',
    price: '13,500원',
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagCS.jpg',
    name: '콜롬비아 수프리모 드립백 10개입',
    description:
        'Narino 소농들이 재배하여 picking과 processing이 뛰어난 원두\n사탕수수의 단맛과 건포도의 달콤한 맛과 감귤맛을 느낄 수 있습니다.',
    cupNote: '감귤 건포도 사탕수수',
    price: '13,500원',
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagKA.jpg',
    name: '케냐 AA 드립백 10개입',
    description:
        '아프리카를 대표하는 산미가 특징인 원두\n달콤한 과일 향과 특유의 쌉쌀한 풍미가 어우러진 것이 특징이며 뛰어난 레몬 맛의 산미를 느낄 수 있습니다.',
    cupNote: '레몬 꽃 밀크초콜릿',
    price: '13,500원',
  ),
];
