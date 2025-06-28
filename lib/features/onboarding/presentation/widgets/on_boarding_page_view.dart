import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/onboarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.imagesPageView1Image,
          backgroundgImage: Assets.imagesPageview1backgroubdimage,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('مرحبًا بك في'), Text('Fruit'), Text('HUB')],
          ),
        ),
        PageViewItem(
            isVisible: (pageController.hasClients
                    ? pageController.page!.round()
                    : 1) !=
                0,
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            image: Assets.imagesPageView2Image,
            backgroundgImage: Assets.imagesPageview2backgroubdimage,
            title: Text(
              'ابحث وتسوق',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 23,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )),
      ],
    );
  }
}
