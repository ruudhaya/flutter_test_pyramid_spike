import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client_impl.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  test('calls http.Client and gets response', () async {
    String url = 'http://www.mocky.io/v2/5e00610e2f00006b0013b349';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    MockHttpClient mockClient = MockHttpClient();
    when(mockClient.get(url, headers: headers))
        .thenAnswer((_) async => http.Response('', 200));

    HttpClientImpl impl = HttpClientImpl(client: mockClient);
    Response response = await impl.get(url, headers: headers);

    verify(mockClient.get(url, headers: headers));
    expect(response.statusCode, 200);
    expect(response.body, '');
  });
}
