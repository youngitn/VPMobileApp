import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:let_log/let_log.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    uri: 'https://hasura.io/learn/graphql',
  );
  static String _token;
  static final AuthLink authLink = AuthLink(getToken: () => _token);
  static final WebSocketLink websocketLink =
  WebSocketLink(
    url: 'wss://hasura.io/learn/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initPayload: () async {
        return {
          'headers': {'Authorization': _token},
        };
      },
    ),
  );
  static final Link link = authLink.concat(httpLink).concat(websocketLink);
  static String token;
  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client =
    ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject:typenameDataIdFromObject),
        link: link,
      ),
    );
    Logger.log(client.value.link.request);
    return client;
  }
}