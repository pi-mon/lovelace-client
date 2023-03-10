import 'dart:convert';
import 'package:lovelace/resources/storage_methods.dart';
import 'package:lovelace/utils/session.dart';

StorageMethods storageMethods = StorageMethods();
Session session = Session();

class RecoMethods {
  Future<List> getProfileList() async {
    String output;
    String message = "An error occurred";
    bool isSuccess = false;

    try {
      output = await session.get('/recommendation');
      print(output);
      try {
        dynamic outputJson = json.decode(output);

        if (outputJson['results'] != null) {
          isSuccess = true;
          message = "Results successfully fetched";
        } else {
          message = outputJson['response'];
        }
      } catch (e) {
        message = "An error occurred";
      }
    } catch (e) {
      output = e.toString();
    }

    print("getProfileList's output: $output");

    return [output, message, isSuccess];
  }

  Future<List> request({required Map<String, String> email}) async {
    String output;
    String message = "An error occurred";
    bool isSuccess = false;

    try {
      output = await session.post('/recommendation/request', email);
      try {
        dynamic outputJson = json.decode(output);

        if (outputJson['results'] != null) {
          isSuccess = true;
          message = "Request successful";
        } else {
          message = outputJson['response'];
        }
      } catch (e) {
        message = "An error occurred";
      }
    } catch (e) {
      output = e.toString();
    }

    print("request's output: $output");

    return [output, message, isSuccess];
  }
}
