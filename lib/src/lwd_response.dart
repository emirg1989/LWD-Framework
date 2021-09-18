class LWDResponse {
  final int statusCode;
  final String message;

  LWDResponse.ok(message) : this(200, message);

  LWDResponse.notFound(message) : this(404, message ?? 'Not Found');

  LWDResponse.internalServerError(body)
      : this(500, body ?? 'Internal server error');

  LWDResponse(this.statusCode, this.message) {
    if (statusCode < 100) {
      throw ArgumentError('Invalid status code: $statusCode.');
    }
  }
}
