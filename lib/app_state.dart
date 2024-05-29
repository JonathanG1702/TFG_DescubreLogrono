import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _DarkMode = await secureStorage.getBool('ff_DarkMode') ?? _DarkMode;
    });
    await _safeInitAsync(() async {
      _tipoVersion =
          await secureStorage.getString('ff_tipoVersion') ?? _tipoVersion;
    });
    await _safeInitAsync(() async {
      _version = await secureStorage.getString('ff_version') ?? _version;
    });
    await _safeInitAsync(() async {
      _idUsuarioLogado = await secureStorage.getString('ff_idUsuarioLogado') ??
          _idUsuarioLogado;
    });
    await _safeInitAsync(() async {
      _idCuentaLogada =
          await secureStorage.getString('ff_idCuentaLogada') ?? _idCuentaLogada;
    });
    await _safeInitAsync(() async {
      _idCuentaNegocio = await secureStorage.getString('ff_idCuentaNegocio') ??
          _idCuentaNegocio;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _DarkMode = false;
  bool get DarkMode => _DarkMode;
  set DarkMode(bool value) {
    _DarkMode = value;
    secureStorage.setBool('ff_DarkMode', value);
  }

  void deleteDarkMode() {
    secureStorage.delete(key: 'ff_DarkMode');
  }

  String _SRegistrarse = 'Desconocido';
  String get SRegistrarse => _SRegistrarse;
  set SRegistrarse(String value) {
    _SRegistrarse = value;
  }

  String _SRegistrarseGoogle = 'Desconocido';
  String get SRegistrarseGoogle => _SRegistrarseGoogle;
  set SRegistrarseGoogle(String value) {
    _SRegistrarseGoogle = value;
  }

  String _SIniciarSesion = 'Desconocido';
  String get SIniciarSesion => _SIniciarSesion;
  set SIniciarSesion(String value) {
    _SIniciarSesion = value;
  }

  String _SIniciarSesionGoogle = 'Desconocido';
  String get SIniciarSesionGoogle => _SIniciarSesionGoogle;
  set SIniciarSesionGoogle(String value) {
    _SIniciarSesionGoogle = value;
  }

  String _SRestablecerContrasena = 'Desconocido';
  String get SRestablecerContrasena => _SRestablecerContrasena;
  set SRestablecerContrasena(String value) {
    _SRestablecerContrasena = value;
  }

  String _SPaginaWeb = '';
  String get SPaginaWeb => _SPaginaWeb;
  set SPaginaWeb(String value) {
    _SPaginaWeb = value;
  }

  String _tipoVersion = '';
  String get tipoVersion => _tipoVersion;
  set tipoVersion(String value) {
    _tipoVersion = value;
    secureStorage.setString('ff_tipoVersion', value);
  }

  void deleteTipoVersion() {
    secureStorage.delete(key: 'ff_tipoVersion');
  }

  String _version = '';
  String get version => _version;
  set version(String value) {
    _version = value;
    secureStorage.setString('ff_version', value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
  }

  String _idUsuarioLogado = '';
  String get idUsuarioLogado => _idUsuarioLogado;
  set idUsuarioLogado(String value) {
    _idUsuarioLogado = value;
    secureStorage.setString('ff_idUsuarioLogado', value);
  }

  void deleteIdUsuarioLogado() {
    secureStorage.delete(key: 'ff_idUsuarioLogado');
  }

  String _idCuentaLogada = '';
  String get idCuentaLogada => _idCuentaLogada;
  set idCuentaLogada(String value) {
    _idCuentaLogada = value;
    secureStorage.setString('ff_idCuentaLogada', value);
  }

  void deleteIdCuentaLogada() {
    secureStorage.delete(key: 'ff_idCuentaLogada');
  }

  String _idCuentaNegocio = '';
  String get idCuentaNegocio => _idCuentaNegocio;
  set idCuentaNegocio(String value) {
    _idCuentaNegocio = value;
    secureStorage.setString('ff_idCuentaNegocio', value);
  }

  void deleteIdCuentaNegocio() {
    secureStorage.delete(key: 'ff_idCuentaNegocio');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
