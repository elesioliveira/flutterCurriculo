import 'package:flutter_curriculo/clientes/model/person_model.dart';
import 'package:flutter_curriculo/clientes/result/person_result.dart';
import 'package:get/get.dart';

import '../repository/clientes_repository.dart';

class ClienteController extends GetxController {
  List<PersonModel> allPerson = [];
  RxBool isLoading = false.obs;
  final personRepositoy = PersonRepository();

  // @override
  // void onInit() {
  //   super.onInit();
  //   getAllPerson();
  // }

  Future<void> getAllPerson() async {
    isLoading.value = true;
    PersonResult<PersonModel> personResult =
        await personRepositoy.getAllPerson();
    isLoading.value = false;

    personResult.when(
      success: (data) {
        allPerson.assignAll(
          data,
        );
        print(
          allPerson,
        );
      },
      error: (message) {},
    );
  }
}
