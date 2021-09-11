class LWDResponse {
  final int statusCode;
  final String body;

  LWDResponse.ok(body) : this(200, body);

  LWDResponse.notFound(body) : this(404, body ?? 'Not Found');

  LWDResponse.internalServerError(body)
      : this(500, body ?? 'Internal server error');

  LWDResponse(this.statusCode, this.body) {
    if (statusCode < 100) {
      throw ArgumentError('Invalid status code: $statusCode.');
    }
  }
}
