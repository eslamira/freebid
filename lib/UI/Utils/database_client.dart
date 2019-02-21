import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:freebid/UI/Utils/auth_client.dart';
import 'package:freebid/model/categoryModel.dart';
import 'package:freebid/model/user_model.dart';

class DatabaseClient {
  // Getting Instance of FirebaseDatabase & Auth Client
  final FirebaseDatabase _databaseClient = FirebaseDatabase.instance;
  final AuthClient _authClient = AuthClient.internal();

  // Making Singleton
  static DatabaseClient _instance = DatabaseClient.internal();

  DatabaseClient.internal();

  factory DatabaseClient() => _instance;

////////////////////////////////////////////////////////////////////////////////
///////////////////////// USER MANAGEMENT METHODS //////////////////////////////
  // Get User ID
  // Returns null on NotFound
  Future<String> getUserID() async {
    return await _authClient.loggedUserID();
  }

  // Checks if user already Registered
  Future<bool> isUserRegistered() async {
    String _userID = await getUserID();
    bool status;

    DatabaseReference usersRef =
        _databaseClient.reference().child("users/" + _userID);

    await usersRef.once().then((snapshot) {
      status = snapshot.value == null ? false : true;
    });
    return status;
  }

  // Adding New User to Database
  // Throws Exceptions if can't, Be Sure to Catch Them somewhere
  Future<bool> addNewUser(UserModel user) async {
    String _userID = await getUserID();
    if (_userID == null) throw Exception("User ID Not Found");
    //if (await isUserRegistered()) throw Exception("User Already Exist");

    DatabaseReference usersRef =
        _databaseClient.reference().child("users/" + _userID);

    await usersRef.set(user.toJson());

    return true;
  }

  // Updating User in Database
  Future<bool> updateUser(UserModel user) async {
    String _userID = await getUserID();
    if (_userID == null) throw Exception("User ID Not Found");
    DatabaseReference usersRef =
        _databaseClient.reference().child("users/" + _userID);

    await usersRef.update(user.toJson());

    return true;
  }

  // Getting User Data
  // Throws Exception if doesn't exist
  Future<UserModel> getCurrentUserData() async {
    String _userID = await getUserID();

    UserModel user = UserModel();

    DatabaseReference usersRef =
        _databaseClient.reference().child("users/" + _userID);

    await usersRef.once().then((snapshot) {
      user = UserModel.fromSnapshot(snapshot);
    });

    return user;
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> cat = List<CategoryModel>();

    DatabaseReference usersRef =
        _databaseClient.reference().child("categories/");

    await usersRef.once().then((snapshot) {
      Map<dynamic, dynamic> temp = snapshot.value;
      temp.values.forEach((tUser) {
        cat.add(CategoryModel(catName: tUser['name']));
      });
    });
    return cat;
  }

  Future<List<CategoryModel>> getProducts() async {
    List<CategoryModel> cat = List<CategoryModel>();

    DatabaseReference usersRef =
        _databaseClient.reference().child("categories/");

    await usersRef.once().then((snapshot) {
      Map<dynamic, dynamic> temp = snapshot.value;
      temp.values.forEach((tUser) {
        cat.add(CategoryModel(catName: tUser['name']));
      });
    });
    return cat;
  }
}
