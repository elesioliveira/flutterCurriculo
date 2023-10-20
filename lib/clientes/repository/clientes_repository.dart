import 'package:dio/dio.dart';
import 'package:flutter_curriculo/clientes/model/person_model.dart';
import 'package:flutter_curriculo/clientes/result/person_result.dart';
import 'package:flutter_curriculo/constantes/endpoints.dart';

class PersonRepository {
  Future<PersonResult<PersonModel>> getAllPerson() async {
    // final result = await _personHttpManager.restRequest(
    //   url: EndpointJson.getAllPerson,
    //   method: HttpMethods.get,
    // );

    final response = await Dio().get(
      EndpointJson.getAllPerson,
    );

    if (response.data != null) {
      final data = PersonModel.fromJsonList(
        response.data,
      );

      return PersonResult.success(data);
    } else {
      return PersonResult.error('Ocorreu um erro inesperado');
    }
  }
}
