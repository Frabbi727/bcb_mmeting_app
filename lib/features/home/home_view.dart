import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BCB Base Project'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            tooltip: 'change_theme'.tr,
            onPressed: () => controller.toggleTheme(),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'error'.trParams({'error': controller.errorMessage.value}),
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.fetchUserProfile("123"),
                  child: Text('retry'.tr),
                ),
              ],
            ),
          );
        }

        final userData = controller.user.value;
        if (userData == null) {
          return Center(child: Text('no_data'.tr));
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome'.trParams({'name': userData.name}),
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'email'.trParams({'email': userData.email}),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              
              // Language Settings Control
              Text(
                'change_lang'.tr,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.changeLanguage('en', 'US'),
                    child: const Text('English'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.changeLanguage('es', 'ES'),
                    child: const Text('Español'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.changeLanguage('bn', 'BD'),
                    child: const Text('বাংলা'),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
