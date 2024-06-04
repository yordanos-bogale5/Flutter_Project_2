import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? db;
  static late DbCollection userCollection;

  static Future<void> connect() async {
    const mongoUri = 'mongodb+srv://morphatend:morph234@cluster0.ilg5d1g.mongodb.net/Cluster0?retryWrites=true&w=majority';
    try {
      db = await Db.create(mongoUri);
      await db!.open();
      userCollection = db!.collection('users');
      inspect(db);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }
}
