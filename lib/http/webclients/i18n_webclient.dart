import 'dart:convert';
import 'package:http/http.dart';

import '../webclient.dart';

const MESSAGES_URI =
    "https://gist.githubusercontent.com/guilhermesilveira/e3494abea95343c5e9f9ee0b9c41acc9/raw/340a39e2f9ca296033e29f1d24b5411c3503c89e/";

class I18NWebClient {
  final String _viewKey;

  I18NWebClient(this._viewKey);

  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get(Uri.parse("$MESSAGES_URI$_viewKey.json"));
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
