import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'main.dart';

/* Class to store databse functions */
class MongoDatabase {
  /* Databse URI */
  static String database =
      'mongodb+srv://imbabyfat:CIS350_Travel_App@travelapp.kqkinpi.mongodb.net/TravelApp?retryWrites=true&w=majority';

/* Retrieves the location information based on user input */
  static Future<List<Map<String, dynamic>>?> getLocation(
      String location) async {
    //final db = Db(database);
    final db = await Db.create(database);
    await db.open();
    final collection = db.collection(captilizeFirstLetter(location));
    try {
      // await db.open();
      final userData = await collection.find().toList();
      await db.close();
      return userData;
    } catch (e) {
      log(e.toString() + " Get LocationsError");
      return null;
    }
  }

  /* Retreive user information from database */
  static Future<Map<String, dynamic>?> getUserAuthentication(
      String email) async {
    // NOTE: Only works for Db.create() otherwise it shows MongoDB connection error
    // final db = Db(database);
    final db = await Db.create(database);
    await db.open();
    final collection = db.collection('Login');
    // try{
    //await db.open();
    final userData = await collection.findOne(where.eq('email', email));
    await db.close();
    return userData;
    // }catch(e){
    //     log(e.toString() + " Get User Authentication Error");
    //     return null;
    // }
  }

  /* Send user information to database */
  static Future<void> sendUserAuthentication(
      String name, String email, String password) async {
    var db = await Db.create(database);
    await db.open();
    var coll = db.collection('Login');
    await coll.insertOne({
      "name": name,
      "email": email,
      "password": password,
      "recent_id": "NULL",
      "save_id": "NULL",
    });
    await db.close();
  }

  /* Get user ObjectId */
  static Future<Map<String, dynamic>?> getObjectId(String id) async {
    // NOTE: Only works for Db.create() otherwise it shows MongoDB connection error
    // final db = Db(database);
    final db = await Db.create(database);
    await db.open();
    final collection = db.collection('Login');
    //String temp = id != null ? userInfo['_id'].toString() : '';
    RegExp regExp = RegExp(r'[a-fA-F0-9]{24}');
    String userId = regExp.stringMatch(id) ?? '';
    // try{
    //await db.open();
    final currentId =
        await collection.findOne(where.eq('_id', ObjectId.parse(userId)));
    await db.close();
    return currentId;
    // }catch(e){
    //     log(e.toString() + " Get User Authentication Error");
    //     return null;
    // }
  }

  /* Update user information on database */
  static Future<void> changeUserInfo(
      String id, String newRecentIDValue, String newSaveIDValue) async {
    var db = await Db.create(database);
    await db.open();
    var coll = db.collection('Login');
        RegExp regExp = RegExp(r'[a-fA-F0-9]{24}');
    String userId = regExp.stringMatch(id) ?? '';
    var selector = where.eq('_id', ObjectId.parse(userId));
    var update1 = modify.set('recent_id', newRecentIDValue);
    var update2 = modify.set('save_id', newSaveIDValue);
    await coll.update(selector, update1);
    await coll.update(selector, update2);
    await db.close();
  }

  /* Update user information on database */
  static Future<void> updatePassword(String id, String newPassword) async {
    var db = await Db.create(database);
    await db.open();
    var coll = db.collection('Login');
            RegExp regExp = RegExp(r'[a-fA-F0-9]{24}');
    String userId = regExp.stringMatch(id) ?? '';
    var selector = where.eq('_id', ObjectId.parse(userId));
    var update1 = modify.set('password', newPassword);
    await coll.update(selector, update1);
    await db.close();
  }
}

/* To use in getLocation() */
String captilizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}
