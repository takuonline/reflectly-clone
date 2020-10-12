import 'dart:convert';
import 'package:http/http.dart' as http;

class DailyPositivesImageGet {
  String searchQuery;
  String url;

  int count;
  String _id='d39cuna-5OO6nrstZp73LJhPXnKJdV28BDbeQcIgFas#';
  DailyPositivesImageGet({this.count,this.searchQuery});

  Future<dynamic>  getImg() async {

try{
  http.Response response = await http.get(
      'https://api.unsplash.com/search/photos?query=$searchQuery&count=$count&random&client_id=$_id');
  String data =  response.body;
  print(response.statusCode);
  print(response);

  return jsonDecode(data);
}
catch(e){
  print(e);
}





  }
}
