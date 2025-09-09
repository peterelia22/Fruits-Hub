import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/fruit_details_body.dart';

class ProductImageBanner extends StatelessWidget {
  const ProductImageBanner({
    super.key,
    required this.widget,
  });

  final FruitDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(120),
        bottomRight: Radius.circular(120),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * .5,
        width: double.infinity,
        color: const Color(0xffF3F5F7),
        child: Stack(
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: widget.productsEntity.imageUrl!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
