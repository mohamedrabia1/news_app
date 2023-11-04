import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/articales_responces_dm.dart';
import 'package:news_app/model/sources_response.dart';

abstract class ApiManager{
  static const apiKey = "a73645c156fa43feb074a3165e4dc90d" ;
  static const baseUrl = "newsapi.org";
  static  Future<SourcesResponseDM> getSources(String categoryId)async{
    Uri url = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey" : apiKey,
      "category" : categoryId
    });
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    SourcesResponseDM sourcesResponse = SourcesResponseDM.fromJson(json);
    if(sourcesResponse.message != null){
      throw Exception(sourcesResponse.message);
    }
    return sourcesResponse;
  }


  static  Future<ArticalesResponcesDm> getArticles(String sourceId)async{
    Uri url = Uri.https(baseUrl,"/v2/everything",{
      "apiKey" : apiKey ,
      "sources" : sourceId
    });
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    ArticalesResponcesDm mySourcesResponse = ArticalesResponcesDm.fromJson(json);
    if(mySourcesResponse.message != null){
      throw Exception(mySourcesResponse.message);
    }
    return mySourcesResponse;

  }

}