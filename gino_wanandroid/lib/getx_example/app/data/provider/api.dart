import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/data/model/model.dart';

//nossa url base
const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

//nossa classe responsável por encapsular os métodos http
class MyApiClient extends GetConnect{
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D

  MyApiClient();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  getAll() async {
    try {
      var response = await get(baseUrl);
      if(response.statusCode == 200){
        Iterable jsonResponse = json.decode(response.body);
        List<MyModel> listMyModel = jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        return listMyModel;
      }else print ('erro');
    } catch(_){ }
  }
}