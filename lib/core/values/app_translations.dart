import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome, @name!',
          'email': 'Email: @email',
          'change_theme': 'Switch ThemeMode',
          'change_lang': 'Switch Language',
          'retry': 'Retry',
          'no_data': 'No User Data Loaded',
          'error': 'Error: @error',
        },
        'es_ES': {
          'welcome': '¡Bienvenido, @name!',
          'email': 'Correo electrónico: @email',
          'change_theme': 'Cambiar Modo de Tema',
          'change_lang': 'Cambiar Idioma',
          'retry': 'Reintentar',
          'no_data': 'No se cargaron datos de usuario',
          'error': 'Error: @error',
        },
        'bn_BD': {
          'welcome': 'স্বাগতম, @name!',
          'email': 'ইমেইল: @email',
          'change_theme': 'থিম পরিবর্তন করুন',
          'change_lang': 'ভাষা পরিবর্তন করুন',
          'retry': 'পুনরায় চেষ্টা করুন',
          'no_data': 'কোন ব্যবহারকারী তথ্য পাওয়া যায়নি',
          'error': 'ত্রুটি: @error',
        },
      };
}
