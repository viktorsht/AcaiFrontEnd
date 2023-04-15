import 'package:flutter/material.dart';

import '../color/app_colors.dart';

class ButtonApp{

  static ButtonStyle themeButtonAppPrimary = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColorApp,
      minimumSize: const Size(130, 50),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );

  static ButtonStyle themeButtonAppSecundary = ElevatedButton.styleFrom(
      backgroundColor: AppColors.secundaryColorApp,
      minimumSize: const Size(100, 50),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );

  static ButtonStyle themeButtonSmall = ElevatedButton.styleFrom(
      backgroundColor: AppColors.secundaryColorApp,
      minimumSize: const Size(100, 40),
    );

  static ButtonStyle themeButtonViewUpdate = ElevatedButton.styleFrom(
      backgroundColor: AppColors.secundaryColorApp,
      padding: const EdgeInsets.symmetric(horizontal: 30),
    );
}