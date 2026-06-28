import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/dimens.dart';
import '../../core/values/translation_keys.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.paddingL),
        child: Obx(() {
          final userData = controller.user.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radiusL),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.paddingL),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 40),
                      ),
                      const SizedBox(height: AppDimens.paddingL),
                      Text(
                        userData?.name ?? 'Guest User',
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: AppDimens.paddingS),
                      Text(
                        userData?.email ?? 'No email associated',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDimens.paddingXL),
              
              Text(
                'Settings',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppDimens.paddingM),
              
              // Theme Toggle
              ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: Text(TranslationKeys.changeTheme.tr),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => controller.toggleTheme(),
              ),
              const Divider(),
              
              // Language Switches
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: Text(TranslationKeys.changeLang.tr),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: AppDimens.paddingS),
                  child: Wrap(
                    spacing: AppDimens.paddingS,
                    children: [
                      ActionChip(
                        label: const Text('English'),
                        onPressed: () => controller.changeLanguage('en', 'US'),
                      ),
                      ActionChip(
                        label: const Text('Español'),
                        onPressed: () => controller.changeLanguage('es', 'ES'),
                      ),
                      ActionChip(
                        label: const Text('বাংলা'),
                        onPressed: () => controller.changeLanguage('bn', 'BD'),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: AppDimens.paddingXXL),
              
              // Logout Button
              ElevatedButton.icon(
                onPressed: () => controller.logout(),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.errorContainer,
                  foregroundColor: theme.colorScheme.onErrorContainer,
                  padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingM),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
