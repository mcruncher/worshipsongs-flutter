import 'package:sqflite/sqflite.dart';

abstract interface class DatabaseService {
  Future<Database> getDatabase();
}