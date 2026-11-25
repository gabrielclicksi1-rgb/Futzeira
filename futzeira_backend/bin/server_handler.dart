import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandler {
  Handler get handler {
    final router = Router();

    router.get('/', (Request resquest) {
      return Response(200, body: 'primeira rota');
    });
    return router.call;
  }
}
