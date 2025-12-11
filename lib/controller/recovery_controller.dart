import 'package:get/get.dart';

class RecoveryController extends GetxController {
  // المتغير الذي سيتم تحديثه
  String _selectedMethod = 'SMS';

  // Getter للوصول للقيمة
  String get selectedMethod => _selectedMethod;

  // دالة لتغيير الاختيار وتحديث الواجهة
  void selectMethod(String method) {
    if (_selectedMethod != method) {
      _selectedMethod = method;
      
      // هنا السحر: نحدث فقط الودجات التي تحمل هذا المعرف (ID)
      update(['method_selection_id']); 
    }
  }

  // دالة الانتقال للشاشة التالية
  void goToNextStep() {
    print("Selected Method: $_selectedMethod");
    // Get.toNamed(Routes.OTP_SCREEN); // مثال للانتقال
  }
}