import 'package:flutter_test/flutter_test.dart';
import 'package:servicelocator_get_it/servicelocator_get_it.dart';

void main() {
  group(ServiceLocatorInitiator, () {
    // this test must be called first.
    test(
      'Creating new service locator before the factory is set will throw error',
      () {
        expect(() => ServiceLocatorInitiator.newServiceLocator(),
            throwsA(isA<ServiceLocatorFactoryNotSetError>()));
      },
    );

    test(
      'Creating new service locator will call the set factory',
      () {
        ServiceLocatorInitiator.setServiceLocatorFactory(
            () => GetItServiceLocator());

        final locator = ServiceLocatorInitiator.newServiceLocator();
        final anotherLocator = ServiceLocator.asNewInstance();
        expect(locator, isA<GetItServiceLocator>());
        expect(anotherLocator, isA<GetItServiceLocator>());
        expect(locator, isNot(anotherLocator));
      },
    );
  });
}
