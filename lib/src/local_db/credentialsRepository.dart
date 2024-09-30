import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:united_app/src/local_db/getDatabase.dart';

class User {
  final int id;
  final String email;
  final String password;
  final String locationId;

  const User(
      {required this.id,
      required this.email,
      required this.password,
      required this.locationId});

  Map<String, Object?> toMap() {
    return {
      'email': email,
      'password': password,
      'locationId': locationId,
    };
  }
}

class CredentialsRepository {
  CredentialsRepository();

  Future<void> addUser(User user) async {
    final db = await getDatabase();

    var tmpUser = await getUser();
    if (tmpUser.isEmpty) {
      await db.insert(
        'user',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      updateUser(user);
    }
  }

  Future<List<User>> getUser() async {
    final db = await getDatabase();

    final userMap = await db.query('user');
    print("before found: $userMap");
    var user =  [
      for (final {
            'email': email as String,
            'password': password as String,
            'locationId': locationId as String,
          } in userMap)
        User(id: 1, email: email, password: password, locationId: locationId),
    ];

      print("user found: $user" );
      return user;

    // return
    //      User(id: 1, email: email, password: password, locationId: locationId)
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await getDatabase();

    await db.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}
