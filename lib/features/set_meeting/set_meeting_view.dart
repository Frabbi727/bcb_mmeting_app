import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/dimens.dart';
import 'set_meeting_controller.dart';

class SetMeetingView extends GetView<SetMeetingController> {
  const SetMeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    DateTime? selectedDate;
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.paddingL),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Schedule a New Meeting',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppDimens.paddingXL),
              
              // Meeting Title
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Meeting Title',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter meeting title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppDimens.paddingL),
              
              // Date picker field
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Meeting Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    selectedDate = picked;
                    dateController.text = "${picked.year}-${picked.month}-${picked.day}";
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppDimens.paddingXL),
              
              // Status Message
              Obx(() {
                if (controller.statusMessage.value.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.paddingM),
                  child: Text(
                    controller.statusMessage.value,
                    style: TextStyle(
                      color: controller.statusMessage.value.contains('success')
                          ? Colors.green
                          : theme.colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
              
              // Action Button / Loader
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() && selectedDate != null) {
                      controller.scheduleMeeting(
                        titleController.text.trim(),
                        selectedDate!,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingM),
                  ),
                  child: const Text('Schedule Meeting'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
