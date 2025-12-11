import 'package:get/get.dart';
import 'package:login/controller/recovery_controller.dart';
import 'package:login/controller/welcome_controller.dart';
class RecoveryBinding extends Bindings {
  @override
  void dependencies() {
    // LazyPut تعني أن الكنترولر لن يتم إنشاؤه إلا عند استخدامه
    Get.lazyPut<RecoveryController>(() => RecoveryController());
    Get.lazyPut<WelcomeController>(() => WelcomeController());
    
  }
}