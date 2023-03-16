Uri buildUri(String path, {required String url, Map<String, String>? params}) {
  Uri baseUri = Uri.parse(url);
  if (baseUri.scheme == 'http') {
    return Uri.http(
      baseUri.host,
      path,
      params,
    );
  } else {
    return Uri.https(baseUri.host, path, params);
  }
}
