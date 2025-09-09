import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/products_entity.dart';
import 'package:fruits_hub/core/widgets/feature_card.dart';

Row buildFeatureList(ProductsEntity product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Visibility(
        visible: product.isOrganic,
        child: const FeatureCard(
          icon: Icons.eco,
          title: '100%',
          subtitle: 'أورجانيك',
          color: Colors.green,
        ),
      ),
      const FeatureCard(
        icon: Icons.calendar_month,
        title: '01 عام',
        subtitle: 'الصلاحيه',
        color: Colors.blue,
      ),
      FeatureCard(
        icon: Icons.local_fire_department,
        title: '${product.numOfCalories} كالوري',
        subtitle: '100 جرام',
        color: Colors.orange,
      ),
    ],
  );
}
