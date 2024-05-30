import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

/* create the database*/
/* ADD: Fuction for database authentication */

class MongoDatabase {
  static Db db = Db('');
/* Establish the server connection */
//final Db db = Db('mongodb+srv://imbabyfat:CIS350_Travel_App@cluster0.popkvuf.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');

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

    // /* example debug info */
    // final documentToInsert = {
    //   "_id": ObjectId(),
    //   "name": "John Doe",
    //   "email": "john@example.com",
    //   "password": "JohnDoe123",
    // };

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

static Future<List<Map<String, dynamic>>?> getLocation(String location) async {
  try {
    final collection = db.collection(location);

    await MongoDatabase.connect();

    final userData = await collection.find().toList();
    await MongoDatabase.close();

    return userData;
  } catch (e) {
    return null;
  }
}


/* Retreive documentation from database */
// final query = where.eq('name', 'John Doe');
// final result = awat collection.findOne(query);

// if(result != null){
//   print('Found document: $result');
// }
// else{
//   print('Document not found');
// }
}
