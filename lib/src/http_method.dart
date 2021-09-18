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
  'PATCH'
];

const String GET = 'GET';
const String HEAD = 'HEAD';
const String POST = 'POST';
const String PUT = 'PUT';
const String DELETE = 'DELETE';
const String CONNECT = 'CONNECT';
const String OPTIONS = 'OPTIONS';
const String TRACE = 'TRACE';
const String PATCH = 'PATCH';
