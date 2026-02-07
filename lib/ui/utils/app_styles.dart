import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles{
  static const TextStyle black16SemiBold = TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 16);
  static const TextStyle black12regular = TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12);
  static const TextStyle black12SemiBold = TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 12);
  static const TextStyle black18SemiBold = TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 18);
  static const TextStyle grey10regular = TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 10);
  static const TextStyle grey12regular = TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12);
  static const TextStyle grey14SemiBold = TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14);
  static const TextStyle blue18SemiBold = TextStyle(color: AppColors.blue, fontWeight: FontWeight.w500, fontSize: 18);
  static const TextStyle white18Medium = TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18);

}