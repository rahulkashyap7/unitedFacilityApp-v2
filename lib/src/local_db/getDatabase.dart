import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final database = await openDatabase(
    join(await getDatabasesPath(), 'united_facilities_local_database.db'),
// When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
// Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE IF NOT EXISTS user(email Text, password Text, locationId Text)',
      );
    },
// Set the version. This executes the onCreate function and provides a
// path to perform database upgrades and downgrades.
    version: 1,
  );
  return database;
}
