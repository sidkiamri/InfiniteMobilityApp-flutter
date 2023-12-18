import 'package:ebike/core/User/AuthManager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import for JSON encoding/decoding

Future<void> thirdPartyLogin(String idToken, String strategy) async {
  print("hello im in third party ");
  final Uri apiUrl = Uri.parse('http://192.168.1.134:9090/api/auth/signin');
  print(idToken); // Update the API endpoint URL
  final Map<String, String> requestBody = {
    'provider': strategy,
    'tokenlogin': idToken,
  };

  try {
    final response = await http.post(
      apiUrl,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle successful response from the server.
      final responseData = json.decode(response.body);
      final apiToken = responseData['api_token'];

      // Store the user data and token in Shared Preferences
      final authManager = AuthManager();
      await authManager.storeUserData(
        responseData[
            'userId'], // Replace with the key your server returns for the user ID
        apiToken,
        DateTime.now().add(Duration(
            seconds: 30 *
                24 *
                60 *
                60)), // Replace with the actual token expiration date
      );

      // You can use apiToken for further authentication or navigation.
    } else {
      print('Server Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
