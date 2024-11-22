import 'package:flutter_test/flutter_test.dart';
import 'package:servicelocator_get_it/servicelocator_get_it.dart';

abstract class A {}

class B implements A {}

void main() {
  group(ServiceLocator, () {
    test('alias', () {
      ServiceLocator locator = GetItServiceLocator();

      locator.registerFactory<B>(() => B());
      locator.alias<A, B>();
      A value = locator();
      expect(value, isA<B>());
    });

    test('getOrNull', () {
      ServiceLocator locator = GetItServiceLocator();

      locator.registerFactory<B>(() => B());

      A? a = locator.getOrNull<A>();
      expect(a, isNull);

      B? b = locator.getOrNull<B>();
      expect(b, isNotNull);
    });

    test('Factory', () {
      ServiceLocator locator = GetItServiceLocator();

      int times = 0;
      locator.registerFactory<B>(() {
        times++;
        return B();
      });

      final factory = locator.factory<B>();
      expect(times, equals(0));
      expect(factory(), isInstanceOf<B>());
      expect(times, equals(1));
      expect(factory(), isInstanceOf<B>());
      expect(times, equals(2));
      // different instance
      expect(factory(), isNot(factory()));
    });

    test('Lazy', () {
      ServiceLocator locator = GetItServiceLocator();

      int times = 0;
      locator.registerFactory<B>(() {
        times++;
        return B();
      });

      final lazy = locator.lazy<B>();
      expect(times, equals(0));
      expect(lazy(), isInstanceOf<B>());
      expect(times, equals(1));
      expect(lazy(), isInstanceOf<B>());
      expect(times, equals(1));
      // the same instance
      expect(lazy(), equals(lazy()));
    });

    test('FactoryAsync', () async {
      ServiceLocator locator = GetItServiceLocator();

      int times = 0;
      locator.registerFactoryAsync<B>(() async {
        times++;
        return B();
      });

      final factory = locator.factoryAsync<B>();
      expect(times, equals(0));
      expect(await factory(), isInstanceOf<B>());
      expect(times, equals(1));
      expect(await factory(), isInstanceOf<B>());
      expect(times, equals(2));
    });

    test('LazyAsync', () async {
      ServiceLocator locator = GetItServiceLocator();

      int times = 0;
      locator.registerFactoryAsync<B>(() async {
        times++;
        return B();
      });

      final factory = locator.lazyAsync<B>();
      expect(times, equals(0));
      expect(await factory(), isInstanceOf<B>());
      expect(times, equals(1));
      expect(await factory(), isInstanceOf<B>());
      expect(times, equals(1));
    });
  });
}
