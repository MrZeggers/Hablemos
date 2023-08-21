import 'dart:developer';

import 'package:flutte_hablemos/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'mongodb.dart';

class MongoDataBase {
  static List<String> fullQuestions = [];

  static Future<void> initialize() async {
    // Try getting the questions from local storage first.
    fullQuestions = await getLocalQuestions();

    // If the questions are not in local storage, fetch from the database.
    if (fullQuestions.isEmpty) {
      await connectToDbAndFetchQuestions();
    }
  }

  static Future<List<String>> getLocalQuestions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('questions_key') ?? [];
    } catch (e) {
      print("Error getting questions from local storage: $e");
      return [];
    }
  }

  static Future<void> connectToDbAndFetchQuestions() async {
    try {
      var db = await Db.create(MONGO_URL);
      await db.open();
      var collection = db.collection(COLLECTION_NAME);
      fullQuestions = await collection
          .find()
          .map((item) => item['pregunta'].toString())
          .toList();

      await saveList(fullQuestions); // Saving the fetched questions locally
    } catch (e) {
      print("Error connecting to database: $e");
    }
  }

  static Future<void> saveList(List<String> questions) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('questions_key', questions);
    } catch (e) {
      print("Error saving questions locally: $e");
    }
  }
}
