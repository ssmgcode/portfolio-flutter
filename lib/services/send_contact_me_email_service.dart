import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

/// Sends the fields of `ContactMeForm` to my email.
Future<bool> sendContactMeEmailService({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  try {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/send-mail');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      }),
    );
    return response.statusCode == 200 ? true : false;
  } catch (error) {
    return false;
  }
}
