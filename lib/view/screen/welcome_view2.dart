import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/welcome_controller.dart';
import 'package:login/core/colors/app_colors.dart';
import '../widget/custom_button.dart'; // إعادة استخدام زر Next/Let's Start

class WelcomeView2 extends GetView<WelcomeController> {
  const WelcomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: AppColors.primary.withOpacity(0.05), // خلفية فاتحة
      body: Center(
        child: Container(
          width: Get.width * 0.85,
          height: Get.height * 0.75,
          margin: const EdgeInsets.only(top: 80),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                // 1. الصورة العلوية (يجب أن تكون خلفيتها شفافة أو مقطوعة بعناية)
                _buildCardImage(),

                const SizedBox(height: 20),

                // 2. المحتوى النصي
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Read?",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textGrey,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),

                        // 3. مؤشرات الصفحات والأزرار
                        _buildFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    // يمكن استخدام PageView هنا إذا كانت الشاشة 11 و 12 جزءاً من نفس التمرير
    return Container(
      height: Get.height * 0.35,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.accentPink.withOpacity(0.1), // خلفية الصورة
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        image: const DecorationImage(
          // هذه صورة وهمية. يجب استبدالها بصورة الفتاة
          image: AssetImage( 'assets/images/person2.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          // مؤشرات الصفحات (النقاط الصغيرة)
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // نفترض 3 صفحات ترحيب إجمالية
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPageIndex.value == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.currentPageIndex.value == index
                        ? AppColors.primary
                        // ignore: deprecated_member_use
                        : AppColors.textGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // الزر
          CustomButton(
            text: "Let's Start",
            onPressed: () {
              controller.navigateToHome();
            },
          ),
        ],
      ),
    );
  }
}
