import 'package:flutter/widgets.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/assets.dart';

class NotifcationWidget extends StatelessWidget {
  const NotifcationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:
          const ShapeDecoration(color: Color(0xFFEEF8ED), shape: OvalBorder()),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}
