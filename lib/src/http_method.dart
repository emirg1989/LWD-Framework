bool isHttpMethod(String method) => httpMethods.contains(method.toUpperCase());

const List<String> httpMethods = [
  'GET',
  'HEAD',
  'POST',
  'PUT',
  'DELETE',
  'CONNECT',
  'OPTIONS',
  'TRACE',
];
