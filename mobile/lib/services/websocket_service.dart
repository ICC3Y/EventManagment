import 'dart:convert';
import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  static const String wsBaseUrl = 'ws://127.0.0.1:8001/ws';

  WebSocketChannel? _gatesChannel;
  WebSocketChannel? _incidentsChannel;
  WebSocketChannel? _pingsChannel;

  Stream<dynamic>? _gatesStream;
  Stream<dynamic>? _incidentsStream;
  Stream<dynamic>? _pingsStream;

  Stream<dynamic> get gatesStream {
    _gatesChannel ??= WebSocketChannel.connect(Uri.parse('$wsBaseUrl/gates'));
    _gatesStream ??= _gatesChannel!.stream.map((event) => jsonDecode(event)).asBroadcastStream();
    return _gatesStream!;
  }

  Stream<dynamic> get incidentsStream {
    _incidentsChannel ??= WebSocketChannel.connect(Uri.parse('$wsBaseUrl/incidents'));
    _incidentsStream ??= _incidentsChannel!.stream.map((event) => jsonDecode(event)).asBroadcastStream();
    return _incidentsStream!;
  }

  Stream<dynamic> get pingsStream {
    _pingsChannel ??= WebSocketChannel.connect(Uri.parse('$wsBaseUrl/pings'));
    _pingsStream ??= _pingsChannel!.stream.map((event) => jsonDecode(event)).asBroadcastStream();
    return _pingsStream!;
  }

  void dispose() {
    _gatesChannel?.sink.close();
    _incidentsChannel?.sink.close();
    _pingsChannel?.sink.close();
  }
}
