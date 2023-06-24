import 'package:recycleai/model/change_password.dart';
import 'package:recycleai/model/login_model.dart';
import 'package:recycleai/model/profile.dart';
import 'package:recycleai/model/simple_model.dart';
import 'package:recycleai/model/update_profile.dart';
import 'package:recycleai/utils/prefs.dart';
import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';
import '../utils/network.dart';

class AuthRepository {
  Dio dio = Network.dio;
  Future<Tuple2<int, SimpleModel>> register(
      String username, String email, String password, String re_password) async {
    try {
      Response response = await dio.post(
        "user/signup",
        data: {
          "name": username,
          "email": email,
          "password": password,
          "re_password": re_password,
        },
      );
      SimpleModel simpleModel = SimpleModel.fromJson(response.data);
      return Tuple2(response.statusCode ?? 400, simpleModel);
    } catch (e) {
      return Tuple2(400, SimpleModel(message: "Something went wrong"));
    }
  }

  Future<Tuple2<int, LoginModel>> login(String email, String password) async {
    try {
      Response response = await dio.post(
        "user/signin",
        data: {
          "email": email,
          "password": password,
        },
      );
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Tuple2(response.statusCode ?? 400, loginModel);
    } catch (e) {
      return Tuple2(400, LoginModel(token: ""));
    }
  }

  Future<Tuple2<int, Profile>> profile() async {
    try {
      Response response = await dio.get(
        "user/current",
        options: Options(
          headers: {"Authorization": "Bearer " + Prefs.getString(Prefs.token)!},
        )
      );
      Profile profile = Profile.fromJson(response.data);
      return Tuple2(response.statusCode ?? 400, profile);
    } catch (e) {
      return Tuple2(400, Profile(status: "", data: Data()));
    }
  }

  Future<Tuple2<int, ChangePassword>> changePassword(String email) async {
    try {
      Response response = await dio.post(
        "user/forgot-password",
        options: Options(
          headers: {"Authorization": "Bearer " + Prefs.getString(Prefs.token)!},
        ),data: {
          "email": email,
        }
      );
      ChangePassword changePassword = ChangePassword.fromJson(response.data);
      return Tuple2(response.statusCode ?? 400, changePassword);
    } catch (e) {
      return Tuple2(400 , ChangePassword(message: ""));
    }
  }

  Future<Tuple2<int, UpdateProfile>> updateProfile(String name, String email) async {
    try {
      Response response = await dio.put(
        "user/update",
        options: Options(
          headers: {"Authorization": "Bearer " + Prefs.getString(Prefs.token)!},
        ),data: {
          "name": name,
          "email": email,
        }
      );
      UpdateProfile updateProfile = UpdateProfile.fromJson(response.data);
      return Tuple2(response.statusCode ?? 400, updateProfile);
    } catch (e) {
      return Tuple2(400 , UpdateProfile(message: ""));
    }
  }
}


