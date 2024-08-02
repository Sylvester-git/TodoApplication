/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todoapp_client/src/protocol/todo.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTodo extends _i1.EndpointRef {
  EndpointTodo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'todo';

  _i2.Future<_i3.Todo> createTodo(_i3.Todo todo) =>
      caller.callServerEndpoint<_i3.Todo>(
        'todo',
        'createTodo',
        {'todo': todo},
      );

  _i2.Future<List<_i3.Todo>> getAllTodo() =>
      caller.callServerEndpoint<List<_i3.Todo>>(
        'todo',
        'getAllTodo',
        {},
      );

  _i2.Future<_i3.Todo> updateTodo(_i3.Todo todo) =>
      caller.callServerEndpoint<_i3.Todo>(
        'todo',
        'updateTodo',
        {'todo': todo},
      );

  _i2.Future<_i3.Todo> deleteTodo(_i3.Todo todo) =>
      caller.callServerEndpoint<_i3.Todo>(
        'todo',
        'deleteTodo',
        {'todo': todo},
      );
}

class _Modules {
  _Modules(Client client) {
    authclient = _i4.Caller(client);
  }

  late final _i4.Caller authclient;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    todo = EndpointTodo(this);
    modules = _Modules(this);
  }

  late final EndpointExample example;

  late final EndpointTodo todo;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'todo': todo,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'authclient': modules.authclient};
}
