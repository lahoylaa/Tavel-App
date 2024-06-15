import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

/* Class to store databse functions */
class MongoDatabase {
  /* Databse URI */
  static String database = 
  'mongodb+srv://imbabyfat:CIS350_Travel_App@travelapp.kqkinpi.mongodb.net/TravelApp?retryWrites=true&w=majority';

/* Retrieves the location information based on user input */
  static Future<List<Map<String, dynamic>>?> getLocation(String location) async {
    //final db = Db(database);
    final db = await Db.create(database);
    final collection = db.collection(location);
    // try{
    await db.open();
    final userData = await collection.find().toList();
    await db.close();
    return userData;
    // }catch(e){
    //    log(e.toString() + " Get Location Error");
    //    return null;
    // }
  }

  /* Retreive user information from database */
  static Future<Map<String, dynamic>?> getUserAuthentication(String email) async {

    // NOTE: Only works for Db.create() otherwise it shows MongoDB connection error
    // final db = Db(database);
    final db = await Db.create(database);
    final collection = db.collection('Login');
    // try{
    await db.open();
    final userData = await collection.findOne(where.eq('email', email));
    await db.close();
    return userData;
    // }catch(e){
    //     log(e.toString() + " Get User Authentication Error");
    //     return null;
    // }
  }

  /* Send user information to database */
  static Future<void> sendUserAuthentication(String name, String email, String password) async {
    /* final db = await Db.create(database);
    final collection = db.collection('Login');
    final userInformation = {
      'name': name,
      'email': email,
      'password': password,
    };
    await db.open();
    await collection.insert(userInformation);
    await db.close(); */
    var db = await Db.create(database);
    await db.open();
    var coll = db.collection('Login');
    await coll.insertOne({
      "name": name,
      "email": email,
      "password": password,
    });
    await db.close();
  }
}

/* Establish the server connection */
//final Db db = Db('mongodb+srv://imbabyfat:CIS350_Travel_App@cluster0.popkvuf.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');

/* NOTE: This are early implementations of the database functions
  static Future<void> connect() async {
    db = await Db.create(
        'mongodb+srv://imbabyfat:CIS350_Travel_App@travelapp.kqkinpi.mongodb.net/TravelApp?retryWrites=true&w=majority');

    try {
      // local host link for mongoUri
      await db.open();
      inspect(db);
    } catch (e) {
      log(e.toString() + "Connect error");
    }
  }

/* Closing the server connection */
  static Future<void> close() async {
    try {
      await db.close();
    } catch (e) {
      log(e.toString() + "close error");
    }
  }

/* Insert documentation into database */
  static Future<void> sendData(
      Map<String, dynamic> document, String collection) async {
    final collectionData = db.collection(collection);

    MongoDatabase.connect();

    await collectionData.insert(document);

    MongoDatabase.close();
  }

  /* Retreive documentation from database */
  static Future<Map<String, dynamic>?> getUserAuthentication(
      String email) async {
    final collection = db.collection('Login');

    MongoDatabase.connect();

    final userData = await collection.findOne(where.eq('email', email));
    MongoDatabase.close();

    return userData;
  }

  static Future<List<Map<String, dynamic>>?> getLocation(
      String location) async {
    try {
      final collection = db.collection(location);

      await MongoDatabase.connect();

      final userData = await collection.find().toList();
      await MongoDatabase.close();

      return userData;
    } catch (e) {
      log(e.toString() + " Fuck this shit man ");
      return null;
    }
  }
*/
