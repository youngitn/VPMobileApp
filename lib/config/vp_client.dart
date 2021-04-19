import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:let_log/let_log.dart';

class VpConfig {

  static final HttpLink httpLink = HttpLink(
    uri: 'http://192.168.0.62:8080/graphiql/',
  );
  static String _token;
  static final AuthLink authLink = AuthLink(getToken: () => _token);
  // static final WebSocketLink websocketLink =
  // WebSocketLink(
  //   url: 'wss://192.168.0.62:8080/graphiql',
  //   config: SocketClientConfig(
  //     autoReconnect: true,
  //     inactivityTimeout: Duration(seconds: 30),
  //     initPayload: () async {
  //       return {
  //         'headers': {'Authorization': _token},
  //       };
  //     },
  //   ),
  // );
  static final Link link = httpLink;
  static String token;
  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    _token = token;
   print('1111111111111');
    ValueNotifier<GraphQLClient> client =
    ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject:typenameDataIdFromObject),
        link: link,
      ),
    );

    return client;
  }


}