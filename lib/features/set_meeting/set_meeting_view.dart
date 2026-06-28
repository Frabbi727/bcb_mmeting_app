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
    final timeController = TextEditingController();
    
    DateTime? selectedDate;
    TimeOfDay? selectedTime;
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
              const SizedBox(height: AppDimens.paddingL),

              // Time picker field
              TextFormField(
                controller: timeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Meeting Time',
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null && context.mounted) {
                    selectedTime = picked;
                    timeController.text = picked.format(context);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
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
                    if (formKey.currentState!.validate() && selectedDate != null && selectedTime != null) {
                      final combinedDateTime = DateTime(
                        selectedDate!.year,
                        selectedDate!.month,
                        selectedDate!.day,
                        selectedTime!.hour,
                        selectedTime!.minute,
                      );

                      // Date Range Past check
                      if (combinedDateTime.isBefore(DateTime.now())) {
                        Get.snackbar(
                          'Scheduling Error',
                          'Cannot schedule a meeting in the past.',
                          backgroundColor: theme.colorScheme.errorContainer,
                          colorText: theme.colorScheme.onErrorContainer,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }

                      controller.scheduleMeeting(
                        titleController.text.trim(),
                        combinedDateTime,
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
