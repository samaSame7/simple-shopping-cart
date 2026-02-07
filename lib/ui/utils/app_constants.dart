import 'package:practice/ui/screens/product_dm/product_dm.dart';
import 'package:practice/ui/utils/app_assets.dart';

abstract final class AppConstants {
  static List<ProductDm> products = [headphone, mobile, tv, tv2, watch];

  static final ProductDm headphone = ProductDm(
    title: "Headphone",
    description: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: "3,950 EGP",
    rate: "4.5",
    reviews: "250 review",
    imgPath: AppAssets.headphone,
  );
  static final ProductDm mobile = ProductDm(
    title: "Iphone",
    description: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: "3,950 EGP",
    rate: "4.5",
    reviews: "250 review",
    imgPath: AppAssets.mobile,
  );
  static final ProductDm tv = ProductDm(
    title: "TV1",
    description: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: "3,950 EGP",
    rate: "4.5",
    reviews: "250 review",
    imgPath: AppAssets.tv,
  );
  static final ProductDm tv2 = ProductDm(
    title: "TV2",
    description: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: "3,950 EGP",
    rate: "4.5",
    reviews: "250 review",
    imgPath: AppAssets.tv2,
  );
  static final ProductDm watch = ProductDm(
    title: "watch",
    description: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
    price: "3,950 EGP",
    rate: "4.5",
    reviews: "250 review",
    imgPath: AppAssets.watch,
  );
}
