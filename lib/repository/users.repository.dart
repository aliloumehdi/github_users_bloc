import 'dart:async';
import 'dart:convert';

import 'package:github_users_bloc/model/users.model.dart';
import 'package:http/http.dart' as http;

class UsersRepository{


  Future<ListUsers> searchUsers(String hey,int p,int s) async {

    String url = "https://api.github.com/search/users?q=$hey&page=$s&per_page=$p";
   try{
   http.Response response = await http.get(Uri.parse(url));
   if(response.statusCode==200)

   return ListUsers.fromJson(json.decode(response.body));

   return throw("Error => ${response.statusCode}");
   }catch(ex){
     return throw("Error => ${ex.toString()}");
   }


  }



}