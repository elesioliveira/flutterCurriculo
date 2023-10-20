const String baseUrl = 'https://parseapi.back4app.com/functions';
const String uriJson = 'https://jsonplaceholder.typicode.com';

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
}

abstract class EndpointJson {
  static const String getAllPerson = '$uriJson/posts';
}
