import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/dimens.dart';
import '../../core/values/translation_keys.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BCB Base Project'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            tooltip: TranslationKeys.changeTheme.tr,
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
                  TranslationKeys.error.trParams({'error': controller.errorMessage.value}),
                  style: TextStyle(color: theme.colorScheme.error),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimens.paddingL),
                ElevatedButton(
                  onPressed: () => controller.fetchUserProfile("123"),
                  child: Text(TranslationKeys.retry.tr),
                ),
              ],
            ),
          );
        }

        final userData = controller.user.value;
        if (userData == null) {
          return Center(child: Text(TranslationKeys.noData.tr));
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TranslationKeys.welcome.trParams({'name': userData.name}),
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppDimens.paddingS),
              Text(
                TranslationKeys.email.trParams({'email': userData.email}),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.brightness == Brightness.light ? Colors.grey[700] : Colors.grey[300],
                ),
              ),
              const SizedBox(height: AppDimens.paddingHuge),
              
              // Language Settings Control
              Text(
                TranslationKeys.changeLang.tr,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: AppDimens.paddingS),
              Wrap(
                spacing: AppDimens.paddingM,
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
