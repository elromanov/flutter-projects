import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    var uri = Uri.parse(url);
    print(url);
    Response response = await get(uri);
    
    if(response.statusCode == 200){
      String data = response.body;
      
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}