import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequst, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          print("${response.statusCode}");
          print("////////////////////////falieaorea");
          return const Left(StatusRequst.serverfailur);
        }
      } else {
        return const Left(StatusRequst.offlinefailur);
      }
    } catch (e) {
      print("==================================");
      print("$e");
      print("========================================");
      return const Left(StatusRequst.serverfailur);
    }
  }

  Future<Either<StatusRequst, Map>> addRequstWithImageOne(
    String url,
    Map data,
    File? image, [
    String? namerequest,
  ]) async {
    try {
      if (await checkInternet()) {
        namerequest ??= "files";
        var uri = Uri.parse(url);
        var request = http.MultipartRequest("POST", uri);

        if (image != null) {
          var length = await image.length();
          var stream = http.ByteStream(image.openRead());
          stream.cast();
          var multipartFile = http.MultipartFile(
            namerequest,
            stream,
            length,
            filename: basename(image.path),
          );
          request.files.add(multipartFile);
        }
        data.forEach((key, value) {
          request.fields[key] = value;
        });

        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequst.serverfailur);
        }
      } else {
        return const Left(StatusRequst.offlinefailur);
      }
    } catch (e) {
      print("=============================");
      print("$e");
      return const Left(StatusRequst.serverfailur);
    }
  }
}
