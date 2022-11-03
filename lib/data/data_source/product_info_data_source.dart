import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/domain/model/product_page_info.dart';

class ProductInfoDataSource {
  Future<Result<ProductPageInfo>> getDripBagInfo() async {
    return Result.success(dripBagPageInfo);
  }

  Future<Result<ProductPageInfo>> getStickCoffeeInfo() async {
    return Result.success(stickCoffeePageInfo);
  }

  Future<Result<ProductPageInfo>> getCoffeeBeansInfo() async {
    return Result.success(coffeeBeansPageInfo);
  }

  Future<Result<ProductDetailPageInfo>> getDripBagDetailInfo() async {
    return Result.success(dripBagPageDetailInfo);
  }

  Future<Result<ProductDetailPageInfo>> getStickCoffeeDetailInfo() async {
    return Result.success(stickCoffeePageDetailInfo);
  }

  Future<Result<ProductDetailPageInfo>> getCoffeeBeansDetailInfo() async {
    return Result.success(coffeeBeansPageDetailInfo);
  }
}

ProductPageInfo dripBagPageInfo = ProductPageInfo(
  title: '드립백',
  subtitle: 'Fedora Drip bag',
  comment: '전 품목 10% 할인',
  imageUrl: 'img/shop/banner/cat_dripbag_fedora.jpg',
  productInfo: dripBagProductInfo,
);

ProductDetailPageInfo dripBagPageDetailInfo = ProductDetailPageInfo(
  title: 'Fedora Dripbag',
  description: '핸드드립 방식 중 가장 우수하다고 알려진 융드립 여과 방식을 적용한 1회용 제품입니다.',
  categories: ['All'],
  productInfo: dripBagProductInfo,
);

List<ProductInfo> dripBagProductInfo = [
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagSL.jpg',
    name: '고릴라빈즈 드립백 셀렉션 10개입',
    description:
        '고릴라 빈즈의 최고급 드립백 5종을 골고루 맛볼 수 있는 종합 세트\n\n에티오피아 예가체프, 과테말라 안티구아, 케냐AA, 코스타리카 따라주, 콜롬비아 수프리모의 5종으로 구성되어 있습니다.',
    cupNote: '각각의 특성에 따름',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['DRIPBAG'],
    qrImage_1: 'img/shop/qr/dripbagSL_1EA.png',
    qrImage_2: 'img/shop/qr/dripbagSL_2EA.png',
    qrImage_3: 'img/shop/qr/dripbagSL_3EA.png',
    qrImage_5: 'img/shop/qr/dripbagSL_5EA.png',
    qrImage_10: 'img/shop/qr/dripbagSL_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=a20wc-fy20h-09v11-13v48-o16jv',
    sourness: 5,
    sweet: 5,
    bitterness: 5,
    bodyTaste: 5,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagEY.jpg',
    name: '에티오피아 예가체프 G2 드립백 10개입',
    description:
        '에티오피아 남부의 고급커피 생산 지역으로 가벼운 바디감으로 부드럽고 꽃내음과 같은 향이 특징\n\n강한 프로랄향과 레드와인과 같은 깊은 풍미가 특징이며 레몬의 산미와 화이트 초콜릿의 고급스러운 맛을 느낄 수 있습니다.',
    cupNote: '레몬 꽃 레드와인',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['DRIPBAG'],
    qrImage_1: 'img/shop/qr/dripbagEY_1EA.png',
    qrImage_2: 'img/shop/qr/dripbagEY_2EA.png',
    qrImage_3: 'img/shop/qr/dripbagEY_3EA.png',
    qrImage_5: 'img/shop/qr/dripbagEY_5EA.png',
    qrImage_10: 'img/shop/qr/dripbagEY_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=q20ii-kh20i-09q07-14z19-e15ge',
    sourness: 4,
    sweet: 3,
    bitterness: 2,
    bodyTaste: 2,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagGA.jpg',
    name: '과테말라 안티구아 드립백 10개입',
    description:
        '비옥한 화산토, 일정한 일교차, 낮은 습도 등의 기후 조건을 가진 과테말라 안티구아(Antigua) 지역의 커피\n\n사탕수수, 코코아, 레몬맛의 산미가 특징이며 다크로스트에서 강한 스모크향과 품질 좋은 시가향을 느낄 수 있습니다.',
    cupNote: '살구 구운아몬드 다크초콜릿',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['DRIPBAG'],
    qrImage_1: 'img/shop/qr/dripbagGA_1EA.png',
    qrImage_2: 'img/shop/qr/dripbagGA_2EA.png',
    qrImage_3: 'img/shop/qr/dripbagGA_3EA.png',
    qrImage_5: 'img/shop/qr/dripbagGA_5EA.png',
    qrImage_10: 'img/shop/qr/dripbagGA_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=i20bq-ps20a-09x08-09x56-v15bw',
    sourness: 4,
    sweet: 4,
    bitterness: 3,
    bodyTaste: 3,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagCT.jpg',
    name: '코스타리카 따라주 SHB 드립백 10개입',
    description:
        '커피재배의 최적의 환경을 갖춘 풍요로운 해안의 나라에서 재배한 원두\n\n고소함, 달콤함, 부드러운 산미, 약간의 꽃향기, 약한 바디감이 조화로워 좋은 밸런스의 커피를 느낄 수 있습니다.',
    cupNote: '라임 볶은땅콩 초콜릿',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['DRIPBAG'],
    qrImage_1: 'img/shop/qr/dripbagCT_1EA.png',
    qrImage_2: 'img/shop/qr/dripbagCT_2EA.png',
    qrImage_3: 'img/shop/qr/dripbagCT_3EA.png',
    qrImage_5: 'img/shop/qr/dripbagCT_5EA.png',
    qrImage_10: 'img/shop/qr/dripbagCT_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=f20fu-wr20j-09w07-14s49-h27up',
    sourness: 4,
    sweet: 4,
    bitterness: 3,
    bodyTaste: 3,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagCS.jpg',
    name: '콜롬비아 수프리모 드립백 10개입',
    description:
        'Narino 소농들이 재배하여 picking과 processing이 뛰어난 원두\n\n사탕수수의 단맛과 건포도의 달콤한 맛과 감귤맛을 느낄 수 있습니다.',
    cupNote: '감귤 건포도 사탕수수',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['DRIPBAG'],
    qrImage_1: 'img/shop/qr/dripbagCS_1EA.png',
    qrImage_2: 'img/shop/qr/dripbagCS_2EA.png',
    qrImage_3: 'img/shop/qr/dripbagCS_3EA.png',
    qrImage_5: 'img/shop/qr/dripbagCS_5EA.png',
    qrImage_10: 'img/shop/qr/dripbagCS_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=y20qt-uj20o-09m08-09d57-i16vq',
    sourness: 4,
    sweet: 4,
    bitterness: 3,
    bodyTaste: 3,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_dripbagKA.jpg',
    name: '케냐 AA 드립백 10개입',
    description:
        '아프리카를 대표하는 산미가 특징인 원두\n\n달콤한 과일 향과 특유의 쌉쌀한 풍미가 어우러진 것이 특징이며 뛰어난 레몬 맛의 산미를 느낄 수 있습니다.',
    cupNote: '레몬 꽃 밀크초콜릿',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['DRIPBAG'],
    qrImage_1: 'img/shop/qr/dripbagKA_1EA.png',
    qrImage_2: 'img/shop/qr/dripbagKA_2EA.png',
    qrImage_3: 'img/shop/qr/dripbagKA_3EA.png',
    qrImage_5: 'img/shop/qr/dripbagKA_5EA.png',
    qrImage_10: 'img/shop/qr/dripbagKA_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=f20bg-hj20z-09w07-14x48-z22un',
    sourness: 4,
    sweet: 3,
    bitterness: 2,
    bodyTaste: 5,
    isBean: false,
  ),
];

ProductPageInfo stickCoffeePageInfo = ProductPageInfo(
  title: '원두스틱 커피',
  subtitle: 'Stick Coffee',
  comment: '전 품목 10% 할인',
  imageUrl: 'img/shop/banner/cat_stick_banner.jpg',
  productInfo: stickCoffeeProductInfo,
);

ProductDetailPageInfo stickCoffeePageDetailInfo = ProductDetailPageInfo(
  title: 'Stick Coffee',
  description: '원두 원액을 추출하여 동결건조한 제품으로 간편하게 드실 수 있습니다.',
  categories: ['All'],
  productInfo: stickCoffeeProductInfo,
);

List<ProductInfo> stickCoffeeProductInfo = [
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_stickTP_100.jpg',
    name: '고릴라빈즈 탄자니아피베리 원두스틱 100개입',
    description:
        '킬리만자로 산의 남서사면 지역에서 재배되며 고도가 높고 균일한 품질로 재배되는 원두\n\n과일향과 백합, 쟈스민향이 나며 약한 초콜렛 맛이 특징으로 자두나 살구의 새콤달콤한 맛이 특징으로 아이스커피로 먹으면 더욱 특별한 맛을 느낄 수 있습니다.',
    cupNote: '자스민 레몬 살구',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['STICK'],
    qrImage_1: 'img/shop/qr/stickTP_100_1EA.png',
    qrImage_2: 'img/shop/qr/stickTP_100_2EA.png',
    qrImage_3: 'img/shop/qr/stickTP_100_3EA.png',
    qrImage_5: 'img/shop/qr/stickTP_100_5EA.png',
    qrImage_10: 'img/shop/qr/stickTP_100_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=t20et-wt20y-08i12-18n55-o58tf',
    sourness: 5,
    sweet: 5,
    bitterness: 2,
    bodyTaste: 2,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_stickTP_30.jpg',
    name: '고릴라빈즈 탄자니아피베리 원두스틱 30개입',
    description:
        '킬리만자로 산의 남서사면 지역에서 재배되며 고도가 높고 균일한 품질로 재배되는 원두\n\n과일향과 백합, 쟈스민향이 나며 약한 초콜렛 맛이 특징으로 자두나 살구의 새콤달콤한 맛이 특징으로 아이스커피로 먹으면 더욱 특별한 맛을 느낄 수 있습니다.',
    cupNote: '자스민 레몬 살구',
    price: 6000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['STICK'],
    qrImage_1: 'img/shop/qr/stickTP_30_1EA.png',
    qrImage_2: 'img/shop/qr/stickTP_30_2EA.png',
    qrImage_3: 'img/shop/qr/stickTP_30_3EA.png',
    qrImage_5: 'img/shop/qr/stickTP_30_5EA.png',
    qrImage_10: 'img/shop/qr/stickTP_30_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=b20si-zm20z-08u12-18k55-o08wz',
    sourness: 5,
    sweet: 5,
    bitterness: 2,
    bodyTaste: 2,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_stickYI_100.jpg',
    name: '고릴라빈즈 예가체프 이디도 원두스틱 100개입',
    description:
        '싱글오리진 커피 중 가장 뛰어난 평가를 받은 커피로 스폐셜티 업계에서 가장 주목하는 원두\n\n커피를 내리면 프리지아 향기가 퍼지며, 달콤하며 산미가 강하고 약한 씁쓸한 맛이 특징이며 꿀에 절인 레몬차와 같은 부드러운 끝 맛을 느낄 수 있습니다.',
    cupNote: '프리지아 꿀 레몬차',
    price: 18000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['STICK'],
    qrImage_1: 'img/shop/qr/stickYI_100_1EA.png',
    qrImage_2: 'img/shop/qr/stickYI_100_2EA.png',
    qrImage_3: 'img/shop/qr/stickYI_100_3EA.png',
    qrImage_5: 'img/shop/qr/stickYI_100_5EA.png',
    qrImage_10: 'img/shop/qr/stickYI_100_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=d20ba-fn20s-08m12-18s54-e37hd',
    sourness: 4,
    sweet: 5,
    bitterness: 3,
    bodyTaste: 3,
    isBean: false,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_stickYI_30.jpg',
    name: '고릴라빈즈 예가체프 이디도 원두스틱 30개입',
    description:
        '싱글오리진 커피 중 가장 뛰어난 평가를 받은 커피로 스폐셜티 업계에서 가장 주목하는 원두\n\n커피를 내리면 프리지아 향기가 퍼지며, 달콤하며 산미가 강하고 약한 씁쓸한 맛이 특징이며 꿀에 절인 레몬차와 같은 부드러운 끝 맛을 느낄 수 있습니다.',
    cupNote: '자스민 레몬 살구',
    price: 6000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['STICK'],
    qrImage_1: 'img/shop/qr/stickYI_30_1EA.png',
    qrImage_2: 'img/shop/qr/stickYI_30_2EA.png',
    qrImage_3: 'img/shop/qr/stickYI_30_3EA.png',
    qrImage_5: 'img/shop/qr/stickYI_30_5EA.png',
    qrImage_10: 'img/shop/qr/stickYI_30_10EA.png',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=h20ek-mu20b-08s12-18n54-x00im',
    sourness: 4,
    sweet: 5,
    bitterness: 3,
    bodyTaste: 3,
    isBean: false,
  ),
];

ProductPageInfo coffeeBeansPageInfo = ProductPageInfo(
  title: '커피 원두',
  subtitle: 'CoffeeBeans',
  comment: '전 품목 10% 할인',
  imageUrl: 'img/shop/banner/cat_beans3.jpg',
  productInfo: coffeeBeansProductInfo,
);

ProductDetailPageInfo coffeeBeansPageDetailInfo = ProductDetailPageInfo(
  title: 'Coffee Beans',
  description: '최고급 품질의 다양한 원두를 취향에 맞게 선택하세요.',
  categories: ['All', '싱글오리진', '디카페인'],
  productInfo: coffeeBeansProductInfo,
);

List<ProductInfo> coffeeBeansProductInfo = [
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_beanGA.jpg',
    name: '과테말라 안티구아 SHB 500g',
    description:
        '비옥한 화산토, 일정한 일교차, 낮은 습도 등의 기후 조건을 가진 과테말라 안티구아(Antigua) 지역의 커피\n\n사탕수수, 코코아, 레몬맛의 산미가 특징이며 다크로스트에서 강한 스모크향과 품질 좋은 시가향을 느낄 수 있습니다.',
    cupNote: '살구 구운아몬드 다크초콜릿',
    price: 15000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '싱글오리진'],
    qrImage_1: 'img/shop/qr/beanGA_1EA.png',
    qrImage_2: 'img/shop/qr/beanGA_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=m20ef-vf20r-12m15-18l02-o37cz',
    dripQrImage_1: 'img/shop/qr/beanGA_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/beanGA_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=z20fy-uo20o-12q15-18j03-r21ma',
    sourness: 4,
    sweet: 4,
    bitterness: 3,
    bodyTaste: 3,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_beanBSE.jpg',
    name: '브라질 세하도 ny-2 파인 컵 17up 500g',
    description:
        '파인 컵(Fine Cup)은 기계로 일괄 수확하여 맛이 균일하며 결점두가 작은 원두\n\n블렌딩 커피의 베이스로 활용하기 좋은 원두로 너트류의 고소한 향과 카라멜의 단맛과 가벼운 산미를 느낄 수 있습니다.',
    cupNote: '베리류 보리 초콜릿',
    price: 10000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '싱글오리진'],
    qrImage_1: 'img/shop/qr/beanBSE_1EA.png',
    qrImage_2: 'img/shop/qr/beanBSE_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=v20wx-xw20l-12n16-11o15-s38it',
    dripQrImage_1: 'img/shop/qr/beanBSE_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/beanBSE_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=l20la-wq20f-12x16-11x17-p38fb',
    sourness: 3,
    sweet: 3,
    bitterness: 3,
    bodyTaste: 4,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_beanEY2.jpg',
    name: '에티오피아 예가체프 G2 워시드 500g',
    description:
        '아프리카를 대표하는 산미가 특징인 원두\n\n달콤한 과일 향과 특유의 쌉쌀한 풍미가 어우러진 것이 특징이며 뛰어난 레몬 맛의 산미를 느낄 수 있습니다.',
    cupNote: '레몬 꽃 밀크초콜릿',
    price: 14000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '싱글오리진'],
    qrImage_1: 'img/shop/qr/beanEY2_1EA.png',
    qrImage_2: 'img/shop/qr/beanEY2_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=m20kb-fs20o-12e16-10b53-y01oz',
    dripQrImage_1: 'img/shop/qr/beanEY2_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/beanEY2_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=d20co-jr20y-12a16-10c55-r14bl',
    sourness: 4,
    sweet: 3,
    bitterness: 2,
    bodyTaste: 2,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_beanKAA.jpg',
    name: '케냐 AA 500g',
    description:
        '에티오피아 남부의 고급커피 생산 지역으로 가벼운 바디감으로 부드럽고 꽃내음과 같은 향이 특징\n\n강한 프로랄향과 레드와인과 같은 깊은 풍미가 특징이며 레몬의 산미와 화이트 초콜릿의 고급스러운 맛을 느낄 수 있습니다.',
    cupNote: '살구 구운아몬드 다크초콜릿',
    price: 20000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '싱글오리진'],
    qrImage_1: 'img/shop/qr/beanKAA_1EA.png',
    qrImage_2: 'img/shop/qr/beanKAA_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=y20tz-cr20i-12w16-11h29-k47jn',
    dripQrImage_1: 'img/shop/qr/beanKAA_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/beanKAA_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=r20dz-nj20u-12g16-11k31-c05hi',
    sourness: 4,
    sweet: 3,
    bitterness: 2,
    bodyTaste: 5,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_beanCSN.jpg',
    name: '콜롬비아 수프리모 나리뇨 17up 500g',
    description:
        'Narino 소농들이 재배하여 picking과 processing이 뛰어난 원두\n\n사탕수수의 단맛과 건포도의 달콤한 맛과 감귤맛을 느낄 수 있습니다.',
    cupNote: '감귤 건포도 사탕수수',
    price: 13000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '싱글오리진'],
    qrImage_1: 'img/shop/qr/beanCSN_1EA.png',
    qrImage_2: 'img/shop/qr/beanCSN_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=l20qi-gv20m-12i16-11y43-x24po',
    dripQrImage_1: 'img/shop/qr/beanCSN_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/beanCSN_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=i20xi-sd20e-12k16-11z44-p16ku',
    sourness: 4,
    sweet: 4,
    bitterness: 3,
    bodyTaste: 3,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_decafGSH.jpg',
    name: '[디카페인]과테말라 SHB 500g',
    description:
        '스위스 워더 프로세스를 이용하여 카페인을 제거한 원두\n\n화학용매제를 이용하지 않고 물의 삼투압을 이용하여 생두의 큰 카페인을 제거하고 맛은 최대한 유지하는 방법을 사용하여 적은 카페인으로 맛있는 커피를 느낄 수 있습니다.',
    cupNote: '호두 브라운슈가 다크초콜릿',
    price: 22000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '디카페인'],
    qrImage_1: 'img/shop/qr/decafGSH_1EA.png',
    qrImage_2: 'img/shop/qr/decafGSH_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=g20wk-wd20b-12v16-11t54-c39ac',
    dripQrImage_1: 'img/shop/qr/decafGSH_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/decafGSH_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=w20xy-ez20c-12q16-11g56-q25nv',
    sourness: 3,
    sweet: 3,
    bitterness: 3,
    bodyTaste: 3,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_decafBSN.jpg',
    name: '[디카페인]브라질 산토스 NY 파인컵 500g',
    description:
        '스위스 워더 프로세스를 이용하여 카페인을 제거한 원두\n\n화학용매제를 이용하지 않고 물의 삼투압을 이용하여 생두의 큰 카페인을 제거하고 맛은 최대한 유지하는 방법을 사용하여 적은 카페인으로 맛있는 커피를 느낄 수 있습니다.',
    cupNote: '서양 배 볶은땅콩 브라운슈가',
    price: 21000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '디카페인'],
    qrImage_1: 'img/shop/qr/decafBSN_1EA.png',
    qrImage_2: 'img/shop/qr/decafBSN_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=p20rw-al20u-12n16-12a32-u56ao',
    dripQrImage_1: 'img/shop/qr/decafBSN_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/decafBSN_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=g20pm-mp20k-12s16-12i34-n33qv',
    sourness: 3,
    sweet: 3,
    bitterness: 3,
    bodyTaste: 3,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_decafGSH.jpg',
    name: '[디카페인]에티오피아 짐마 (Djimmah) G4 500g',
    description:
        '스위스 워더 프로세스를 이용하여 카페인을 제거한 원두\n\n화학용매제를 이용하지 않고 물의 삼투압을 이용하여 생두의 큰 카페인을 제거하고 맛은 최대한 유지하는 방법을 사용하여 적은 카페인으로 맛있는 커피를 느낄 수 있습니다.',
    cupNote: '청포도 카라멜 녹차',
    price: 22000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '디카페인'],
    qrImage_1: 'img/shop/qr/decafED4_1EA.png',
    qrImage_2: 'img/shop/qr/decafED4_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=y20fo-va20g-12l16-12j42-d03rg',
    dripQrImage_1: 'img/shop/qr/decafED4_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/decafED4_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=j20iq-mp20h-12u16-12a42-o49nk',
    sourness: 3,
    sweet: 3,
    bitterness: 3,
    bodyTaste: 3,
    isBean: true,
  ),
  ProductInfo(
    imageUrl: 'img/shop/product/thumb_decafCMS.jpg',
    name: '[디카페인]콜롬비아 메데린 수프리모(Medelin Supremo) 500g',
    description:
        '스위스 워더 프로세스를 이용하여 카페인을 제거한 원두\n\n화학용매제를 이용하지 않고 물의 삼투압을 이용하여 생두의 큰 카페인을 제거하고 맛은 최대한 유지하는 방법을 사용하여 적은 카페인으로 맛있는 커피를 느낄 수 있습니다.',
    cupNote: '살구 레몬에이드 카라멜',
    price: 23000,
    dcRate: 10,
    shippingFee: 2500,
    categories: ['BEANS', '디카페인'],
    qrImage_1: 'img/shop/qr/decafCMS_1EA.png',
    qrImage_2: 'img/shop/qr/decafCMS_2EA.png',
    qrImage_3: '',
    qrImage_5: '',
    qrImage_10: '',
    qrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=p20id-hs20b-12x16-13k06-m30kd',
    dripQrImage_1: 'img/shop/qr/decafCMS_DR1EA.png',
    dripQrImage_2: 'img/shop/qr/decafCMS_DR2EA.png',
    dripQrImage_3: '',
    dripQrImage_5: '',
    dripQrImage_10: '',
    dripQrImage_1_Url:
        'https://api.instapay.kr/v3/qrm?i=m20yt-ts20v-12j16-13m07-i28am',
    sourness: 3,
    sweet: 3,
    bitterness: 3,
    bodyTaste: 3,
    isBean: true,
  ),
];
