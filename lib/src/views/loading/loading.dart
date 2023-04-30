import 'package:app/src/frame/app_colors.dart';
import 'package:flutter/material.dart';


class LoagindPage extends StatelessWidget {
  const LoagindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: AppColors.secundaryColorApp,
            strokeWidth: 8,
          ),
          SizedBox(height: 20),
          Text(
            "Carregando..",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}