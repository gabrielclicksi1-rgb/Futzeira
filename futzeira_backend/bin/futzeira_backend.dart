import 'package:shelf/shelf.dart' hide ServerHandler;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'server_handler.dart';

void main() async {
  var _server = ServerHandler();

  final server = await shelf_io.serve(_server.handler, 'localhost', 8080);
}
