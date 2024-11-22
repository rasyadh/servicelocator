import 'package:flutter_test/flutter_test.dart';
import 'package:servicelocator_get_it/servicelocator_get_it.dart';

class SutRegistrar extends Registrar {
  List<ServiceLocator> registerCalls = [];
  @override
  Future<void> register(ServiceLocator locator) async {
    registerCalls.add(locator);
  }
}

class SutInitiator extends Initiator {
  List<ServiceLocator> initCalls = [];
  @override
  Future<void> init(ServiceLocator locator) async {
    initCalls.add(locator);
  }
}

void main() {
  group(Initiator, () {
    test("Registering Registrar will call register internally", () {
      final locator = GetItServiceLocator();
      final registrar = SutRegistrar();

      locator.registerRegistrar(registrar);
      expect(registrar.registerCalls, contains(locator));
    });

    test("Registering Initiator will call init internally", () {
      final locator = GetItServiceLocator();
      final initiator = SutInitiator();

      locator.registerRegistrar(initiator);
      expect(initiator.initCalls, contains(locator));
    });
  });
}
