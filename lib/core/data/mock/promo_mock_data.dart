import 'package:davai_store/core/model/promo_model.dart';

final promos = [
  PromoModel(
    title: 'خصومات حتى 50%',
    subtitle: 'على جميع المنتجات الطبية',
    image: 'assets/images/promo.png',
    buttonText: 'تسوق الآن',
    route: '/offers',
  ),

  PromoModel(
    title: 'منتجات جديدة',
    subtitle: 'وصلت حديثاً للمتجر',
    image: 'assets/images/promo.png',
    buttonText: 'اكتشف الآن',
    route: '/new-products',
  ),
];
