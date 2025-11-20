import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "https://education.corewave.io/api";

  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();


  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }

  Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("user_id", userId);
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user_id");
  }

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }


  Future<Map<String, dynamic>> userSignup(String email) async {
    return _post("/user-signup", {"email": email});
  }

  Future<Map<String, dynamic>> userLogin(String email) async {
    return _post("/user-login", {"email": email});
  }

  Future<Map<String, dynamic>> _post(String url, Map data) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl$url"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      return jsonDecode(res.body);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/user-verifyotp"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );

      final data = jsonDecode(response.body);
      print("VERIFY OTP RESPONSE: $data");

      if (response.statusCode == 200) {
        if (data["token"] != null) {
          await saveToken(data["token"]);
          final id = int.tryParse(data["token"].toString().split("|")[0]);
          if (id != null) {
            await saveUserId(id);
            print("USER ID SAVED FROM TOKEN: $id");
          }
        }

        return {
          "success": true,
          "message": data["message"] ?? "OTP verified",
          "data": data
        };
      }

      return {"success": false, "message": data["message"] ?? "Invalid OTP"};
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }


  Future<Map<String, dynamic>> savePersonalDetails({
    required String firstName,
    required String lastName,
    required String email,
    String? alternateMobile,
    File? image,
  }) async {
    try {
      final token = await getToken();
      final userId = await getUserId();

      print("TOKEN USED: $token");
      print("USER ID USED: $userId");

      // if (token == null || userId == null) {
      //   return {"success": false, "message": "User not authenticated"};
      // }

      var request = http.MultipartRequest(
        "POST",
        Uri.parse("$baseUrl/save-personal-details"),
      );

      request.headers["Accept"] = "application/json";
      request.headers["Authorization"] = "Bearer $token";

      request.fields["first_name"] = firstName;
      request.fields["last_name"] = lastName;
      request.fields["email"] = email;
    

      if (alternateMobile != null) {
        request.fields["alternate_mobile"] = alternateMobile;
      }

      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath("image", image.path),
        );
      }
      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {"success": true, "message": data["message"], "data": data};
      }
      return {"success": false, "message": data["message"]};
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
  Future<void> saveExamCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('exam_category', category);
  }
  Future<String?> getExamCategory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('exam_category');
  }
  Future<void> saveExamDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('exam_date', date);
  }
  Future<String?> getExamDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('exam_date');
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }


  Future<Map<String, dynamic>> addWeakSubject({
  required int examId,
  required List<int> weakSubjects,
}) async {
  try {
    final token = await getToken();
    // final userId = await getUserId();

    var request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/add-week-subject"),
    );

    request.headers["Accept"] = "application/json";
    request.headers["Authorization"] = "Bearer $token";

    // request.fields["user_id"] = userId.toString();
    request.fields["exam_id"] = examId.toString();

    for (var subject in weakSubjects) {
      request.fields["weak_subjects[]"] = subject.toString();
    }

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {"success": true, "message": data["message"], "data": data};
    }

    return {"success": false, "message": data["message"]};
  } catch (e) {
    return {"success": false, "message": e.toString()};
  }
}



// FETCH WEAK SUBJECTS
Future<Map<String, dynamic>> fetchWeakSubjects(int examId) async {
  try {
    final token = await getToken();

    final response = await http.post(
      Uri.parse("$baseUrl/fetch-weak-subject"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"exam_id": examId}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {"success": true, "data": data["data"]};
    }

    return {"success": false, "message": data["message"]};
  } catch (e) {
    return {"success": false, "message": e.toString()};
  }
}

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
