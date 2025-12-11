import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/recovery_controller.dart';
import 'package:login/core/colors/app_colors.dart'; // تأكد من وجود ملف الألوان
import '../widget/wavy_header.dart'; // تأكد من وجود الودجات السابقة
import '../widget/custom_button.dart';
import '../widget/option_card.dart';

class RecoveryView extends GetView<RecoveryController> {
  const RecoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // لون الخلفية الأبيض
      body: Stack(
        children: [
          // 1. الجزء الثابت: الهيدر
          const WavyHeader(),

          // 2. المحتوى
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // الجزء الثابت: الصورة
                  _buildAvatar(),

                  const SizedBox(height: 24),

                  // الجزء الثابت: النصوص
                  const Text(
                    "Password Recovery",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "How you would like to restore\nyour password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, height: 1.5),
                  ),

                  const SizedBox(height: 40),

                  // 3. الجزء المتغير (Dynamic Part): هنا نستخدم GetBuilder
                  // هذا هو الجزء الوحيد الذي سيعاد رسمه عند استدعاء update
                  GetBuilder<RecoveryController>(
                    id: 'method_selection_id', // يجب أن يطابق الـ ID في المتحكم
                    builder: (logic) {
                      return Column(
                        children: [
                          OptionCard(
                            label: "SMS",
                            isSelected: logic.selectedMethod == 'SMS',
                            onTap: () => logic.selectMethod('SMS'),
                          ),
                          OptionCard(
                            label: "Email",
                            isSelected: logic.selectedMethod == 'Email',
                            onTap: () => logic.selectMethod('Email'),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  // زر التالي
                  CustomButton(
                    text: "Next",
                    onPressed: () {
                      controller.goToNextStep();
                      Get.toNamed("/welcome");
                    },
                  ),

                  const SizedBox(height: 20),

                  // زر إلغاء
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 2),
        ],
      ),
      child: const CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xFFF5F5F5),
        // استخدم asset أو network image
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }
}
