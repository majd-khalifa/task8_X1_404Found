class ApiResponse<T> {
  final T data;
  final String message;
  final int statusCode;
  final String? token; // التوكن اختياري

  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
    this.token,
  });

  factory ApiResponse.fromJson(List<dynamic> json, T Function(dynamic) create) {
    final body = json[0];
    final code = json[1];

    // استخراج التوكن إذا موجود داخل data
    String? extractedToken;
    if (body['data'] is Map && body['data']['token'] != null) {
      extractedToken = body['data']['token'];
    }

    return ApiResponse(
      data: create(body['data']),
      message: body['message'],
      statusCode: code,
      token: extractedToken,
    );
  }
}
