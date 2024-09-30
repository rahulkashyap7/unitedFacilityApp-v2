import 'package:get_storage/get_storage.dart';

class UflLocalStorage {
  static final UflLocalStorage _instance = UflLocalStorage._internal();

  factory UflLocalStorage() {
    return _instance;
  }

  UflLocalStorage._internal();

  final _storage = GetStorage();

//   Generic method to dave data
  Future<void> saveData<Ufl>(String key, Ufl value) async {
    await _storage.write(key, value);
  }

//   Generic method to read Data
  Ufl? readData<Ufl>(String key) {
    return _storage.read<Ufl>(key);
  }

// Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// Clear all data in storage
  Future<void> cleaarAll() async {
    await _storage.erase();
  }
}
