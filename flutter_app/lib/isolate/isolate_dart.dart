import 'dart:isolate';

Future<void> main() async {
  print("result:${await asyncFactoriali(4)}");
}

Future<dynamic> asyncFactoriali(n) async {
  final response = ReceivePort();
  await Isolate.spawn(_isolate, response.sendPort);

  final sendPort = await response.first as SendPort;
  final answer = ReceivePort();
  sendPort.send([n, answer.sendPort]);
  return answer.first;
}

_isolate(SendPort initReplyTo) async {
  final port = ReceivePort();
  initReplyTo.send(port.sendPort);
  final message = await port.first as List;
  final data = message[0] as int;
  final send = message[1] as SendPort;
  send.send(asyncFactoriali(data));
}