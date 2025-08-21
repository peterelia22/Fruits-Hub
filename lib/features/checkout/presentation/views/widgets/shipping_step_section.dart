import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingStepSection extends StatefulWidget {
  const ShippingStepSection({super.key});

  @override
  State<ShippingStepSection> createState() => _ShippingStepSectionState();
}

class _ShippingStepSectionState extends State<ShippingStepSection> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            currentIndex = 0;
            setState(() {});
          },
          isSelected: currentIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 40} جنيه',
        ),
        const SizedBox(
          height: 8,
        ),
        ShippingItem(
          isSelected: currentIndex == 1,
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
          onTap: () {
            currentIndex = 1;
            setState(() {});
          },
        )
      ],
    );
  }
}
