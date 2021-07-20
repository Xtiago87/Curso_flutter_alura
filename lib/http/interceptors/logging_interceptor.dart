import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    print("request");
    print("headers: ${data!.headers}");
    print("body: ${data.body}");
    print("url: ${data.baseUrl}");
    print("method: ${data.method}");

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    print("response");
    print("headers: ${data!.headers}");
    print("body: ${data.body}");
    print("status code: ${data.statusCode}");

    return data;
  }
}
