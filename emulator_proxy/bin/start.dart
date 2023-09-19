import 'package:emulator_proxy/emulator_proxy.dart';

Future<void> main(List<String> args) async {
  final authProxy = EmulatorProxy(proxyPort: 9098, emulatorPort: 9099);

  authProxy.serve();
}
