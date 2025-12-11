import 'package:get/get.dart';

class WelcomeController extends GetxController {
  // متغير لتتبع ما إذا كنا في شاشة "Hello" أو "Ready" (إذا كانت جزءاً من PageView)
  final RxInt currentPageIndex = 0.obs; // استخدام RxInt لجعلها تفاعلية (Obx)

  // دالة تُستدعى عند الضغط على زر "Let's Start"
  void navigateToHome() {
    // يمكن هنا إضافة منطق لتخزين حالة إكمال الترحيب
    print("Navigating to the main application...");
    // Get.offAllNamed(Routes.HOME); 
  }

  // دالة لتغيير الصفحة (لشاشات 11 و 12)
  void nextPage() {
    if (currentPageIndex.value < 1) { // نفترض أن هناك صفحتين (11 و 12)
      currentPageIndex.value++;
    }
  }
}