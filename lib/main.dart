import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/view/screen/welcome_view.dart';
import 'package:login/view/screen/welcome_view2.dart';
import 'view/screen/recovery_view.dart';
import 'package:login/core/app_binding.dart/recovery_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      // تعريف المسار الأولي مع الربط
      initialRoute: '/recovery',
      getPages: [
        GetPage(
          name: '/recovery',page: () => const RecoveryView(),binding: RecoveryBinding(),),
          GetPage(name: "/welcome", page: () => const WelcomeView(),),
          GetPage(name: "/welcome2", page: () => const WelcomeView2(),) // هنا يتم ربط المتحكم بالشاشة),
        // يمكنك إضافة باقي الصفحات هنا بنفس الطريقة
        // GetPage(name: '/otp', page: () => OtpView(), binding: OtpBinding()),
      ],
    );
  }
}