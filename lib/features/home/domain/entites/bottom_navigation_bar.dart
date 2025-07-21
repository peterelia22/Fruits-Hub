import 'package:fruits_hub/core/utils/assets.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage, name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveHome,
          inActiveImage: Assets.imagesInActiveHome,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveElements,
          inActiveImage: Assets.imagesInActiveElements,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveShoppingCart,
          inActiveImage: Assets.imagesInActiveShoppingCart,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveUser,
          inActiveImage: Assets.imagesInActiveUser,
          name: 'حسابي'),
    ];
