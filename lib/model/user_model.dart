import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String fName = '';
  String lName = '';
  String phoneNum = "";
//  String gender = "";

  UserModel();

  UserModel.fromSnapshot(DataSnapshot snapshot)
      : phoneNum = snapshot.value == null ? "" : snapshot.value["p"],
        fName = snapshot.value == null ? "" : snapshot.value["fn"],
        lName = snapshot.value == null ? "" : snapshot.value["ln"];
//        gender = snapshot.value == null
//            ? ""
//            : snapshot.value["g"] == "m"
//                ? "m"
//                : snapshot.value["g"] == "f" ? "f" : "n";

  toJson() {
    return {
      "p": phoneNum,
      "fn": fName,
      "ln": lName,
//      "g": gender,
    };
  }
}
