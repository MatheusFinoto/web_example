import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '/src/stores/base_store.dart';
import 'environment.dart';

class ApiBaseHelper {
  final String _baseUrl = Environment.apiUrl;
  final BaseStore baseStore = GetIt.I<BaseStore>();

  http.Client client = http.Client();

  Future<dynamic> get({required String endpoint}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response = await http.get(url, headers: baseStore.getHeader());
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  Future<dynamic> post({required String endpoint, required String body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response =
          await http.post(url, headers: baseStore.getHeader(), body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  Future<dynamic> put({required String endpoint, String? body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response =
          await http.put(url, headers: baseStore.getHeader(), body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  Future<dynamic> patch(
      {required String endpoint, required String body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response =
          await http.patch(url, headers: baseStore.getHeader(), body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  Future<dynamic> delete({required String endpoint, String? body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response =
          await http.delete(url, headers: baseStore.getHeader(), body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
