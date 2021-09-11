class LWDResponse {
  final int statusCode;
  final String body;

  LWDResponse.ok(
    body, {
    Map<String, Object> headers,
  }) : this(200, body: body, headers: headers);

  LWDResponse.notFound(
    body, {
    Map<String, Object> headers,
  }) : this(404, body: body ?? 'Not Found', headers: headers);

  LWDResponse.internalServerError(
    body, {
    Map<String, Object> headers,
  }) : this(500, body: body ?? 'Internal server error', headers: headers);

  LWDResponse(
    this.statusCode, {
    this.body,
    Map<String, Object> headers,
  }) {
    if (statusCode < 100) {
      throw ArgumentError('Invalid status code: $statusCode.');
    }
  }
}
