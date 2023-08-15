import 'dart:developer';

import 'package:flutte_hablemos/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

export 'mongodb.dart';

class MongoDataBase {
  static List fullQuestions = [];

  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    fullQuestions = await collection
        .find()
        .map((item) => item['pregunta'].toString())
        .toList();
    print(fullQuestions);
  }
}
