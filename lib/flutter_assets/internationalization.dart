import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // iniciarSesion_Registrarse
  {
    'obcb9clx': {
      'es': 'INICIAR SESION',
      'en': 'SIGN IN',
    },
    'oalsefrl': {
      'es': 'Complete los campos a continuación\npara acceder a su cuenta',
      'en': 'Complete the fields below to access your account',
    },
    'hb9f9uhc': {
      'es': 'Correo electrónico',
      'en': 'Email address',
    },
    'htm6bcn1': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '07ewgq7o': {
      'es':
          'La contraseña debe tener:\n- Mínimo de 10 caracteres\n- Mayúsculas, minúsculas\n- Números y caracteres \n   especiales (@, #, \$, %, &, -)\n- No debe contener espacios',
      'en':
          'The password must have:\n- Minimum of 10 characters\n- Uppercase, lowercase\n- Numbers and special characters (@, #, \$, %, &, -)\n- Should not contain spaces',
    },
    '8xhqh1vv': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'jmmjqa8a': {
      'es': 'El formato del correo no es válido',
      'en': 'The email format is not valid',
    },
    '1dyqwrq7': {
      'es': '',
      'en': '',
    },
    'nffoncqq': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    '7lyqlfnu': {
      'es': 'Debe de contener al menos 10 caracteres',
      'en': 'It must contain at least 10 characters',
    },
    '4ohlunxb': {
      'es': 'El formato no cumple con requisitos mínimos',
      'en': 'The format does not meet minimum requirements',
    },
    'a8ogluq5': {
      'es': '',
      'en': '',
    },
    'ym6pldhf': {
      'es': 'INICIAR SESION',
      'en': 'SIGN IN',
    },
    'laftcho1': {
      'es': 'CONTINUAR CON GOOGLE',
      'en': 'SIGN IN WITH GOOGLE',
    },
    '2glmpa98': {
      'es': '¿Has olvidado tu contraseña?',
      'en': 'Forgot your password?',
    },
    'nnhbia2s': {
      'es': 'Restablecer contraseña',
      'en': 'Reset Password',
    },
    'dlugnt52': {
      'es': 'REGISTRARSE',
      'en': 'REGISTER',
    },
    '4fga3psf': {
      'es':
          'Complete los campos a continuación\npara registrarse en la aplicación',
      'en': 'Please fill out the fields below to register for the application',
    },
    '5u88nob8': {
      'es': 'Correo electronico',
      'en': 'Email address',
    },
    'wxhgr7e1': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'd10qyxst': {
      'es': 'Repetir contraseña',
      'en': 'Repeat password',
    },
    'dmvtlor0': {
      'es':
          'La contraseña debe tener:\n- Mínimo de 10 caracteres\n- Mayúsculas, minúsculas\n- Números y caracteres \n   especiales (@, #, \$, %, &, -)\n- No debe contener espacios',
      'en':
          'The password must have:\n- Minimum of 10 characters\n- Uppercase, lowercase\n- Numbers and special characters (@, #, \$, %, &, -)\n- Should not contain spaces',
    },
    'r44259ej': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    '19r9l1u6': {
      'es': 'El formato del correo no es válido',
      'en': 'The email format is not valid',
    },
    '8ebeewnf': {
      'es': '',
      'en': '',
    },
    'vssi6hk7': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    '1nlheqv0': {
      'es': 'Debe de contener al menos 10 caracteres',
      'en': 'It must contain at least 10 characters',
    },
    'bphe76kg': {
      'es': 'El formato no cumple con requisitos mínimos',
      'en': 'The format does not meet minimum requirements',
    },
    'cq2dtw42': {
      'es': '',
      'en': '',
    },
    '7krkat3q': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'ju3c2yze': {
      'es': 'Debe de contener al menos 10 caracteres',
      'en': 'It must contain at least 10 characters',
    },
    '364d1rcc': {
      'es': 'El formato no cumple con requisitos mínimos',
      'en': 'The format does not meet minimum requirements',
    },
    'b2niwutd': {
      'es': '',
      'en': '',
    },
    'bnciyp5f': {
      'es': 'REGISTRASE',
      'en': 'REGISTER',
    },
    'gg6i46eu': {
      'es': 'CONTINUAR CON GOOGLE',
      'en': 'REGISTER WITH GOOGLE',
    },
    '0bqkhhue': {
      'es': '',
      'en': '',
    },
  },
  // inicio
  {
    'e9ljxpeu': {
      'es': 'GUIA PINCHOS 2023',
      'en': 'TAPAS GUIDE 2023',
    },
    'cz3a1u4w': {
      'es': 'VISUALIZAR',
      'en': 'VISUALIZE',
    },
    '2vk29cpk': {
      'es': 'INICIO',
      'en': 'HOME',
    },
  },
  // negocios
  {
    '11wr3chc': {
      'es': 'Bar',
      'en': 'Bar',
    },
    'ujwh1eac': {
      'es': 'Restaurante',
      'en': 'Restaurant',
    },
    'wyfdz1s1': {
      'es': 'Bar',
      'en': 'Bar',
    },
    'tccxfwwr': {
      'es': 'BUSCAR',
      'en': 'FIND',
    },
  },
  // datos_cuenta
  {
    'yihzgjfy': {
      'es': 'Cuenta verificada',
      'en': 'Verified account',
    },
    'nc22n84j': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    'wly8a0ga': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'rc5rpd2b': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    '3wcds0l8': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'olbr37ne': {
      'es': '**********',
      'en': '**********',
    },
    '45a9w6ww': {
      'es': 'Id usuario',
      'en': 'User id',
    },
    'zc7ns2sx': {
      'es': '*********************',
      'en': '*********************',
    },
    'kzb62eh3': {
      'es': '',
      'en': '',
    },
    '1wtu9eny': {
      'es': 'Nombre y apellidos',
      'en': 'First and last names',
    },
    'sz201mpb': {
      'es': 'DNI/Pasaporte',
      'en': 'DNI/Passport',
    },
    'mzqn8vl1': {
      'es': 'Id usuario',
      'en': 'User id',
    },
    'm0ia8ble': {
      'es': '*********************',
      'en': '*********************',
    },
    'rhv58wid': {
      'es': '',
      'en': '',
    },
    '5pik3vwr': {
      'es': 'Suscripción',
      'en': 'Subscription',
    },
    'uzcdh256': {
      'es': 'Tipo suscripción:',
      'en': 'Subscription type:',
    },
    'vbata0nv': {
      'es': 'Configuración',
      'en': 'Settings',
    },
    '7tfcs5kf': {
      'es': 'Idioma:',
      'en': 'Language:',
    },
    'j6num86r': {
      'es': 'Cambiar',
      'en': 'Change',
    },
    '5e1qnkc5': {
      'es': 'Modo:',
      'en': 'Mode:',
    },
    'z97gctli': {
      'es': 'Cambiar',
      'en': 'Change',
    },
    'ikpunevp': {
      'es': 'CAMBIAR CUENTA',
      'en': 'SWITCH ACCOUNT',
    },
    '8jpv7r98': {
      'es': 'CERRAR SESION',
      'en': 'LOG OUT',
    },
    'suqes2cj': {
      'es': 'CUENTA',
      'en': 'ACCOUNT',
    },
  },
  // completarDatosUsuario
  {
    '680y05fh': {
      'es': 'CUENTA DE USUARIO',
      'en': 'USER ACCOUNT',
    },
    'vp03owqs': {
      'es':
          'Estás a punto de crearte una cuenta de usuario. Para ello necesitamos que rellenes los siguientes datos',
      'en':
          'You are about to create a user account. For this, we need you to fill in the following information',
    },
    'zazai3lr': {
      'es': 'DATOS PERSONALES',
      'en': 'PERSONAL INFORMATION',
    },
    '0w9vqn63': {
      'es':
          'Los datos definidos como \"personales\" no serán visibles para el resto de usuarios en ningún momento',
      'en':
          'The information defined as \"personal\" will not be visible to other users at any time',
    },
    'mondtqo7': {
      'es': 'Edad',
      'en': 'Age',
    },
    'jrwcddho': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    'p7n556bp': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    '5f0yo5nu': {
      'es': '',
      'en': '',
    },
    'taleob83': {
      'es': 'DATOS USUARIO',
      'en': 'USER DATA',
    },
    'mxqg4msa': {
      'es':
          'Los datos definidos como \"usuario\" serán visibles para el resto de usuarios en ningún momento',
      'en':
          'The information defined as \"user\" will not be visible to other users at any time',
    },
    'odoz87qv': {
      'es': 'Nombre de usuario',
      'en': 'Username',
    },
    'y6nb5sdu': {
      'es':
          'El nombre de usuario ha de cumplir:\n- Mínimo de 2 caracteres\n- Máximo de 16 caracteres\n- Se permiten caracteres alfanuméricos',
      'en':
          'The username must adhere to:\n- Minimum of 2 characters\n- Maximum of 16 characters\n- Alphanumeric characters are allowed',
    },
    'dgnlh264': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'smuia2e9': {
      'es': 'El mínimo de caracteres es de 2',
      'en': 'The minimum character count is 2',
    },
    'kzwxfj9c': {
      'es': 'El máximo de caracteres es de 16',
      'en': 'The maximum character count is 16',
    },
    '9ll7briv': {
      'es': 'El nombre de usuario no es válido',
      'en': 'The username is not valid',
    },
    'dirfiau7': {
      'es': '',
      'en': '',
    },
    'h5l1qrp6': {
      'es': 'COMPROBAR DISPONIBILIDAD',
      'en': 'CHECK AVAILABILITY',
    },
    'td1xy9p5': {
      'es': 'CREAR CUENTA',
      'en': 'CREATE ACCOUNT',
    },
    'p34tq21i': {
      'es': 'VOLVER ATRÁS',
      'en': 'COME BACK',
    },
    '2k6osb1f': {
      'es': '',
      'en': '',
    },
  },
  // restablecerContrasena
  {
    '1lsv9pto': {
      'es':
          'Introduce el correo para recibir un enlace mediante el que podrás restablecer la contraseña de la cuenta',
      'en': 'Please fill out the fields below to reset your account password',
    },
    'cgtdz5s5': {
      'es': 'Correo electrónico',
      'en': 'Email address',
    },
    'vnavd1gd': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is mandatory',
    },
    'kwzb1qd6': {
      'es': 'El formato del correo no es válido',
      'en': 'The email format is invalid',
    },
    'xxjb1fnc': {
      'es': '',
      'en': '',
    },
    'xef4w1rb': {
      'es': 'RESTABLECER CONTRASEÑA',
      'en': 'RESET PASSWORD',
    },
    'aeidyq0s': {
      'es': 'VOLVER ATRÁS',
      'en': 'GO BACK',
    },
    'cffq873c': {
      'es': '',
      'en': '',
    },
  },
  // seleccionarCuenta
  {
    'tr086vvw': {
      'es': 'Seleccione la cuenta a la que desee acceder, o cree una nueva',
      'en': 'Select the account you wish to access, or create a new one',
    },
    'hib4zf14': {
      'es': 'USUARIOS',
      'en': 'USERS',
    },
    'qfyaxxjl': {
      'es': 'CREAR',
      'en': 'CREATE',
    },
    'wmczsgij': {
      'es':
          'Para poder crear un nuevo usuario debe de mejorar el plan de su cuenta',
      'en': 'To create a new user, you must upgrade your account plan',
    },
    'yrt2wdlu': {
      'es': 'NEGOCIOS',
      'en': 'BUSINESSES',
    },
    'q6trun5d': {
      'es': 'CREAR',
      'en': 'CREATE',
    },
    'otg2scw9': {
      'es':
          'Para poder crear un nuevo negocio debe de mejorar el plan de su cuenta',
      'en': 'To create a new user, you need to upgrade your account plan',
    },
    'd0mjuili': {
      'es': 'Tipo:',
      'en': 'Type:',
    },
    'syx09i7d': {
      'es': '',
      'en': '',
    },
  },
  // seleccionar_TipoPlan
  {
    'y5ykrbql': {
      'es': 'Elige un plan que funcione para ti',
      'en': 'Choose a plan that works for you',
    },
    's7k5zsxm': {
      'es': 'PAGO MENSUAL',
      'en': 'MONTHLY PAYMENT',
    },
    'tslbqkcv': {
      'es': 'PAGO ANUAL',
      'en': 'ANNUAL PAYMENT',
    },
    'jhn5j35n': {
      'es': '(AHORRAS UN 20%)',
      'en': '(You save 20%)',
    },
    'cv6139nc': {
      'es': 'Características\nque incluye',
      'en': 'Features included',
    },
    'j8lsmhxl': {
      'es': 'CONTINUAR',
      'en': 'CONTINUE',
    },
    'zinr8p3o': {
      'es': '',
      'en': '',
    },
  },
  // completarDatosNegocio
  {
    'l2olgoe5': {
      'es': 'CUENTA DE NEGOCIO',
      'en': 'USER ACCOUNT',
    },
    '6b6gym5s': {
      'es':
          'Estás a punto de crearte una cuenta de negocio. Para ello necesitamos que rellenes los siguientes datos',
      'en':
          'You are about to create a user account. For this, we need you to fill in the following information',
    },
    'lcn6arsq': {
      'es': 'Nombre y apellidos',
      'en': 'First and last name',
    },
    'nqf48m0x': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'v47pe2ab': {
      'es': '',
      'en': '',
    },
    'r2hoi06a': {
      'es': 'DNI',
      'en': 'DNI',
    },
    'ohc6e3v4': {
      'es': 'DNI',
      'en': 'DNI',
    },
    '0e6wf568': {
      'es': 'Pasaporte',
      'en': 'Passport',
    },
    'eefhq4u2': {
      'es': 'DNI',
      'en': 'DNI',
    },
    'fyu0qgsi': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'dttevbqq': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5g8uu1gq': {
      'es': 'Pasaporte',
      'en': 'Passport',
    },
    'pcrah5x7': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'n84xltzz': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'hoqlr23h': {
      'es': 'Nombre del negocio',
      'en': 'Business name',
    },
    'yug3wav8': {
      'es': 'Este campo es obligatorio',
      'en': 'This field is required',
    },
    'srpnzhs0': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '03wtmt36': {
      'es': 'CREAR CUENTA',
      'en': 'CREATE ACCOUNT',
    },
    'd7qebm0v': {
      'es': 'VOLVER ATRÁS',
      'en': 'COME BACK',
    },
    'bjpc0qxd': {
      'es': '',
      'en': '',
    },
  },
  // perfil_negocio
  {
    'ygpi7yzt': {
      'es': 'VOLVER ATRAS',
      'en': 'GO BACK',
    },
    'yahlelya': {
      'es': 'PREVISUALIZANDO',
      'en': 'PREVIEWING',
    },
    'kvj3x8ls': {
      'es': 'Llamar',
      'en': 'To call',
    },
    'k5slhcgx': {
      'es': 'Compartir',
      'en': 'To call',
    },
    'l0xjgk4n': {
      'es': 'Editar',
      'en': 'Edit',
    },
    'ssm5la0f': {
      'es': 'RESUMEN',
      'en': 'SUMMARY',
    },
    'z8y9zmgp': {
      'es': 'HORARIO',
      'en': 'SCHEDULE',
    },
    'ib6ulns7': {
      'es': 'Lunes',
      'en': 'Monday',
    },
    'frwv9cg8': {
      'es': 'Martes',
      'en': 'Tuesday',
    },
    'dwnmepi9': {
      'es': 'Miércoles',
      'en': 'Wednesday',
    },
    'cv5kmuyi': {
      'es': 'Jueves',
      'en': 'Thursday',
    },
    'uvaf4v8u': {
      'es': 'Viernes',
      'en': 'Friday',
    },
    'c9bk4xzv': {
      'es': 'Sabado',
      'en': 'Saturday',
    },
    '86wltoif': {
      'es': 'Domingo',
      'en': 'Sunday',
    },
    '10r6ak3m': {
      'es': 'MENÚ',
      'en': 'MENU',
    },
    'tkrwo27w': {
      'es': 'DESTACADO',
      'en': 'FEATURED',
    },
    '4m9yiu7i': {
      'es': 'RESEÑAS',
      'en': 'REVIEWS',
    },
    'qiet9ra2': {
      'es': 'Publicar',
      'en': 'PUBLISH',
    },
    '5s108d8m': {
      'es': 'El usuario está verificado',
      'en': 'The user is verified',
    },
    '9s3c0m2d': {
      'es': '(Editado)',
      'en': '(Edited)',
    },
    'om0z0k2p': {
      'es': 'Editar',
      'en': 'Edit',
    },
    'y353uv4s': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    'ibjvs48q': {
      'es': 'FOTOS',
      'en': 'PHOTOS',
    },
    'yvv4scc3': {
      'es': '',
      'en': '',
    },
  },
  // editar_perfil_negocio
  {
    'r8iuu2eb': {
      'es': 'VOLVER ATRAS',
      'en': 'GO BACK',
    },
    'q9zafpk4': {
      'es': 'EDITAR PERFIL DEL NEGOCIO',
      'en': 'EDIT BUSINESS PROFILE',
    },
    'jgcg76wl': {
      'es': 'DATOS',
      'en': 'DATA',
    },
    'rbt0lnu2': {
      'es': 'INFORMACIÓN GENERAL',
      'en': 'GENERAL INFORMATION',
    },
    'vr28hvc3': {
      'es': 'NOMBRE',
      'en': 'NAME',
    },
    'wvp38sft': {
      'es': 'TIPO DE NEGOCIO',
      'en': 'BUSINESS TYPE',
    },
    'qa227rpk': {
      'es': '',
      'en': '',
    },
    '3dp73azq': {
      'es': '',
      'en': '',
    },
    'qm0yuqhx': {
      'es': 'LOGO DEL NEGOCIO/MARCA',
      'en': 'BUSINESS/BRAND LOGO',
    },
    'mmj9iy5g': {
      'es': 'VISUALIZAR',
      'en': 'VIEW',
    },
    'ly1b2ak8': {
      'es': 'SUBIR',
      'en': 'UPLOAD',
    },
    '6e1ry7tf': {
      'es': 'BORRAR',
      'en': 'DELETE',
    },
    'p4ksggv3': {
      'es': 'DETALLES DEL NEGOCIO',
      'en': 'BUSINESS DETAILS',
    },
    'y7h8egnx': {
      'es': 'DESCRIPCIÓN',
      'en': 'DESCRIPTION',
    },
    'qdixgpuv': {
      'es': 'DIRECCIÓN',
      'en': 'ADDRESS',
    },
    '8dbf81lm': {
      'es': 'HORARIO',
      'en': 'SCHEDULE',
    },
    '2av7misq': {
      'es': 'LUNES',
      'en': 'MONDAY',
    },
    '9ot1xmo0': {
      'es': 'MARTES',
      'en': 'TUESDAY',
    },
    'ch7yl94t': {
      'es': 'MIÉRCOLES',
      'en': 'WEDNESDAY',
    },
    'z0cd6uqz': {
      'es': 'JUEVES',
      'en': 'THURSDAY',
    },
    '02klgis0': {
      'es': 'VIERNES',
      'en': 'FRIDAY',
    },
    'rbxqd14e': {
      'es': 'SÁBADO',
      'en': 'SATURDAY',
    },
    'kp5ovfam': {
      'es': 'DOMINGO',
      'en': 'SUNDAY',
    },
    '3typsv1m': {
      'es': 'Abierto',
      'en': 'Open',
    },
    'mrx80a3r': {
      'es': 'Cerrado',
      'en': 'Close',
    },
    'xb3eb5uo': {
      'es': 'Abierto',
      'en': 'Open',
    },
    '0srgbxq5': {
      'es': 'Cerrado',
      'en': 'Close',
    },
    'gmqm5za4': {
      'es': 'Abierto',
      'en': 'Open',
    },
    'y49j82o4': {
      'es': 'Cerrado',
      'en': 'Close',
    },
    '8007ub9l': {
      'es': 'Abierto',
      'en': 'Open',
    },
    'k1unpwdd': {
      'es': 'Cerrado',
      'en': 'Close',
    },
    '3chifjgp': {
      'es': 'Abierto',
      'en': 'Open',
    },
    'b127wy4g': {
      'es': 'Cerrado',
      'en': 'Close',
    },
    '2tzpern0': {
      'es': 'Abierto',
      'en': 'Abierto',
    },
    'g74unyc6': {
      'es': 'Cerrado',
      'en': 'Cerrado',
    },
    'f2j5qc8m': {
      'es': 'Abierto',
      'en': 'Abierto',
    },
    'n8zqmhuq': {
      'es': 'Cerrado',
      'en': 'Cerrado',
    },
    '7qp5p4z4': {
      'es': 'TELEFONO',
      'en': 'PHONE',
    },
    'v6n872l3': {
      'es': 'PÁGINA WEB',
      'en': 'WEBSITE',
    },
    'ou4ecb4s': {
      'es': 'REDES SOCIALES',
      'en': 'SOCIAL MEDIA',
    },
    'wppa7qkv': {
      'es':
          'Para enlazar el perfil de tu negocio en la red social que elijas, haz click en una de las siguientes redes sociales',
      'en':
          'Para enlazar el perfil de tu negocio en la red social que elijas, haz click en una de las siguientes redes sociales',
    },
    'way6vtr9': {
      'es': 'GUARDAR',
      'en': 'SAVE',
    },
    'kb96jg0m': {
      'es': 'VISUALIZAR',
      'en': 'VIEW',
    },
    'banefpeg': {
      'es': 'CUSTOMIZAR',
      'en': 'CUSTOMIZE',
    },
    'edpiusuc': {
      'es': 'PROXIMAMENTE...',
      'en': 'COMING SOON...',
    },
    'aq5lpef7': {
      'es':
          'Esta opción no se encuentra disponible actualmente. Mantente al tanto a futuras actualizaciones',
      'en':
          'This option is currently unavailable. Stay tuned for future updates',
    },
    'ssib0rby': {
      'es': 'MENU',
      'en': 'MENU',
    },
    '2nkc9ty3': {
      'es': 'PROXIMAMENTE...',
      'en': 'COMING SOON...',
    },
    'xxl63ozl': {
      'es':
          'Esta opción no se encuentra disponible actualmente. Si desea realizar cualquier cambio, envienos un correo a descubrelogrono.bussines.support@gmail.com',
      'en':
          'This option is currently unavailable. Stay tuned for future updates',
    },
    'gj6vzrq2': {
      'es': 'VISUALIZAR',
      'en': 'VIEW',
    },
    'gd8wf2y9': {
      'es': '',
      'en': '',
    },
  },
  // servicioNoDisponible
  {
    'pcq5svet': {
      'es': 'Estado:',
      'en': 'Status:',
    },
    'ymewvigl': {
      'es': 'ACEPTAR',
      'en': 'ACCEPT',
    },
  },
  // aviso_cargando
  {
    '7tskjqoq': {
      'es': 'CARGANDO...',
      'en': 'LOADING...',
    },
  },
  // aviso_ejecutando
  {
    'buq4d15j': {
      'es': 'EJECUTANDO...',
      'en': 'RUNNING...',
    },
  },
  // cabecera_InfoApp_01
  {
    'kes4qz5o': {
      'es': 'V.',
      'en': 'V.',
    },
    'a056dj44': {
      'es': 'Descubre\nLogroño',
      'en': 'Discover\nLogroño',
    },
    'e3sc0bn5': {
      'es': 'PAGINA WEB',
      'en': 'WEBSITE',
    },
  },
  // noPoseeCuentaUsuario
  {
    'v5lvkr3l': {
      'es': 'Parece que aún no tienes un usuario. ¡Crea uno!',
      'en': 'It seems you still don\'t have a user. Create one!',
    },
  },
  // elegir_idioma
  {
    'iv0rdplb': {
      'es': 'IDIOMA',
      'en': 'LANGUAGE',
    },
    'qfbuxwzi': {
      'es': 'Español',
      'en': 'Spanish',
    },
    '9abfc72g': {
      'es': 'Inglés',
      'en': 'English',
    },
  },
  // cabecera_InfoApp_02
  {
    'br6ix5j7': {
      'es': 'Descubre\nLogroño',
      'en': 'Discover\nLogroño',
    },
    'emp90k94': {
      'es': 'PAGINA WEB',
      'en': 'WEBSITE',
    },
  },
  // noPoseeCuentaNegocio
  {
    '4nzrpu0o': {
      'es': 'Parece que aún no tienes una cuenta de negocio. ¡Crea una!',
      'en': 'It seems you still don\'t have a business account. Create one!',
    },
  },
  // crearEditar_resena
  {
    'n9352mj0': {
      'es': 'Cuéntanos más sobre tu experiencia',
      'en': 'Tell us more about your experience',
    },
  },
  // establecer_red_social
  {
    '850awvpw': {
      'es': 'Introduzca el enlace a su perfil para hacerlo visible al público',
      'en': 'Enter the link to your profile to make it visible to the public',
    },
    'btjs2212': {
      'es': 'ESTABLECER',
      'en': 'ESTABLISH',
    },
  },
  // Miscellaneous
  {
    'zlgr48tc': {
      'es': '',
      'en': '',
    },
    'mj2mhohc': {
      'es':
          '¡Activa la cámara para capturar momentos épicos y compartirlos con el resto de usuarios!',
      'en': '',
    },
    'bhvk4z4z': {
      'es': 'Permite que te mostremos información relevante cerca de ti',
      'en': '',
    },
    'wrqg62nn': {
      'es':
          '¡Recibirás avisos importantes y recordatorios que no se te escaparán!',
      'en': '',
    },
    'puid783d': {
      'es': 'Te permitirá poder subir contenido a la plataforma',
      'en': '',
    },
    'j2434xxs': {
      'es':
          'Se ha producido un error con la autentificación. Vuelve a intentarlo',
      'en': 'An authentication error has occurred. Please try again',
    },
    'jsqvanop': {
      'es': '',
      'en': '',
    },
    'wn1m3qml': {
      'es': '',
      'en': '',
    },
    'efdardyo': {
      'es': '',
      'en': '',
    },
    '9cz7a0lw': {
      'es': '',
      'en': '',
    },
    'ehexkeqc': {
      'es': '',
      'en': '',
    },
    'b5rlmsmn': {
      'es': '',
      'en': '',
    },
    'gn16r1gz': {
      'es': '',
      'en': '',
    },
    'eardaw2l': {
      'es': '',
      'en': '',
    },
    '35hu7r35': {
      'es': 'El correo introducido ya pertenece a otra cuenta',
      'en': 'The entered email already belongs to another account',
    },
    '5qreem4y': {
      'es': 'Error con las credenciales introducidas. Revísalas',
      'en': 'Error with the entered credentials. Please check them',
    },
    'hnr3g9yr': {
      'es': '',
      'en': '',
    },
    'zia3v6uo': {
      'es': '',
      'en': '',
    },
    '0qdak2iq': {
      'es': '',
      'en': '',
    },
    'o1onq356': {
      'es': '',
      'en': '',
    },
    '7qw67s3c': {
      'es': '',
      'en': '',
    },
    't3az3jye': {
      'es': '',
      'en': '',
    },
    'wtc74x0b': {
      'es': '',
      'en': '',
    },
    'h8kae130': {
      'es': '',
      'en': '',
    },
    'khtjndt4': {
      'es': '',
      'en': '',
    },
    'lxom9ks5': {
      'es': '',
      'en': '',
    },
    'r9xtsids': {
      'es': '',
      'en': '',
    },
    '4sknq1yk': {
      'es': '',
      'en': '',
    },
    'ecsa1rgp': {
      'es': '',
      'en': '',
    },
    'e9agc40q': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
