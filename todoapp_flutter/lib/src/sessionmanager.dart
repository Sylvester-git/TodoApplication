import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todoapp_client/todoapp_client.dart';

late Client client;
late SessionManager sessionManager;


Future initializesessionmanager([String? apiurl]) async {
  client = Client('http://$apiurl/',
      authenticationKeyManager: FlutterAuthenticationKeyManager())
    ..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.authclient,
  );
  await sessionManager.initialize();
}
