import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  String id;
  String name;
  String job;
  String created;

  Post({this.id, this.name, this.job, this.created});

  //membuat object dari post
  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  //lem api
  static Future<Post> connectApi(String name, String jobs) async {
    String apiUrl = "https://reqres.in/api/users";
    var apiResult = await http.post(apiUrl, body: {
      //kumpulan parameter
      "name": name,
      "job": jobs,
    });
    var jsonObject = json.decode(apiResult.body);

    return Post.createPost(jsonObject);
  }
}
