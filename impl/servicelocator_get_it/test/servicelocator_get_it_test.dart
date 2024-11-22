import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:servicelocator_get_it/servicelocator_get_it.dart';

class MockGetIt extends Mock implements GetIt {}

class MockRegistrar extends Mock implements Registrar {}

void main() {
  group(GetItServiceLocator, () {
    // this test must be called first.
    late MockGetIt getIt;
    late GetItServiceLocator locator;
    setUpAll(() async {
      getIt = MockGetIt();
      locator = GetItServiceLocator(getIt: getIt);
      registerFallbackValue(locator);
    });

    test('onScopeChanged', () {
      locator.onScopeChanged;
      verify(() => getIt.onScopeChanged).called(1);
    });

    test('allReady', () {
      when(getIt.allReady).thenAnswer((_) async {});

      locator.allReady();
      verify(() => getIt.allReady()).called(1);
    });

    test('allReadySync', () {
      when(getIt.allReadySync).thenReturn(false);
      locator.allReadySync();
      verify(() => getIt.allReadySync()).called(1);
    });

    test('call', () {
      when(getIt.call<String>).thenReturn("false");

      locator.call<String>();
      verify(() => getIt.call<String>()).called(1);
    });

    test('currentScopeName', () {
      locator.currentScopeName;
      verify(() => getIt.currentScopeName).called(1);
    });

    test('get', () {
      when(getIt.get<String>).thenReturn("false");

      locator.get<String>();
      verify(() => getIt.get<String>()).called(1);
    });

    test('getAsync', () {
      when(getIt.getAsync<String>).thenAnswer((_) async => "null");

      locator.getAsync<String>();
      verify(() => getIt.getAsync<String>()).called(1);
    });

    test('isReady', () {
      when(getIt.isReady<String>).thenAnswer((_) async {});

      locator.isReady<String>();
      verify(() => getIt.isReady<String>()).called(1);
    });

    test('isReadySync', () {
      when(getIt.isReadySync<String>).thenReturn(true);

      locator.isReadySync<String>();
      verify(() => getIt.isReadySync<String>()).called(1);
    });

    test('isRegistered', () {
      when(getIt.isRegistered<String>).thenReturn(true);

      locator.isRegistered<String>();
      verify(() => getIt.isRegistered<String>()).called(1);
    });

    test('popScope', () {
      when(getIt.popScope).thenAnswer((_) async {});

      locator.popScope();
      verify(() => getIt.popScope()).called(1);
    });

    test('popScopesTill', () {
      when(() => getIt.popScopesTill("")).thenAnswer((_) async => false);

      locator.popScopesTill("");
      verify(() => getIt.popScopesTill("")).called(1);
    });

    test('pushNewScope', () {
      locator.pushNewScope();
      verify(() => getIt.pushNewScope(
          init: any(named: "init"),
          scopeName: any(named: "scopeName"),
          dispose: any(named: "dispose"))).called(1);
    });

    test('registerFactory', () {
      when(() => getIt.registerFactory<String>(any(),
          instanceName: any(named: "instanceName"))).thenReturn(null);

      locator.registerFactory<String>(() => "", instanceName: "sa");
      verify(() => getIt.registerFactory<String>(any(),
          instanceName: any(named: "instanceName"))).called(1);
    });

    test('registerFactoryAsync', () {
      when(() => getIt.registerFactoryAsync<String>(any(),
          instanceName: any(named: "instanceName"))).thenReturn(null);

      locator.registerFactoryAsync<String>(() async => "", instanceName: "sa");
      verify(() => getIt.registerFactoryAsync<String>(any(),
          instanceName: any(named: "instanceName"))).called(1);
    });

    test('registerFactoryParam', () {
      when(() => getIt.registerFactoryParam<String, bool, bool>(any(),
          instanceName: any(named: "instanceName"))).thenReturn(null);

      locator.registerFactoryParam<String, bool, bool>((_, __) => "",
          instanceName: "sa");
      verify(() => getIt.registerFactoryParam<String, bool, bool>(any(),
          instanceName: any(named: "instanceName"))).called(1);
    });

    test('registerFactoryParamAsync', () {
      when(() => getIt.registerFactoryParamAsync<String, bool, bool>(any(),
          instanceName: any(named: "instanceName"))).thenReturn(null);

      locator.registerFactoryParamAsync<String, bool, bool>((_, __) async => "",
          instanceName: "sa");
      verify(() => getIt.registerFactoryParamAsync<String, bool, bool>(any(),
          instanceName: any(named: "instanceName"))).called(1);
    });

    test('resetLazySingleton', () {
      when(getIt.resetLazySingleton<String>).thenReturn(null);

      locator.resetLazySingleton<String>();
      verify(() => getIt.resetLazySingleton<String>()).called(1);
    });

    test('registerLazySingletonAsync', () {
      when(() => getIt.registerLazySingletonAsync<String>(any(),
          instanceName: any(named: "instanceName"),
          dispose: any(named: "dispose"))).thenReturn(null);

      locator.registerLazySingletonAsync<String>(() async => "");
      verify(() => getIt.registerLazySingletonAsync<String>(any(),
          instanceName: any(named: "instanceName"),
          dispose: any(named: "dispose"))).called(1);
    });

    test('registerSingleton', () {
      const hei = "hey";
      when(() => getIt.registerSingleton<String>(hei,
          instanceName: any(named: "instanceName"),
          signalsReady: any(named: "signalsReady"),
          dispose: any(named: "dispose"))).thenReturn(hei);

      locator.registerSingleton<String>(hei);
      verify(() => getIt.registerSingleton<String>(hei,
          instanceName: any(named: "instanceName"),
          signalsReady: any(named: "signalsReady"),
          dispose: any(named: "dispose"))).called(1);
    });

    test('registerSingletonAsync', () {
      const hei = "hey";
      when(() => getIt.registerSingletonAsync<String>(any(),
          instanceName: any(named: "instanceName"),
          dependsOn: any(named: "dependsOn"),
          signalsReady: any(named: "signalsReady"),
          dispose: any(named: "dispose"))).thenReturn(null);

      locator.registerSingletonAsync<String>(() async => hei);
      verify(() => getIt.registerSingletonAsync<String>(any(),
          instanceName: any(named: "instanceName"),
          dependsOn: any(named: "dependsOn"),
          signalsReady: any(named: "signalsReady"),
          dispose: any(named: "dispose"))).called(1);
    });

    test('registerSingletonWithDependencies', () {
      const hei = "hey";
      when(() => getIt.registerSingletonWithDependencies<String>(any(),
          instanceName: any(named: "instanceName"),
          dependsOn: any(named: "dependsOn"),
          signalsReady: any(named: "signalsReady"),
          dispose: any(named: "dispose"))).thenReturn(null);

      locator.registerSingletonWithDependencies<String>(() => hei);
      verify(() => getIt.registerSingletonWithDependencies<String>(any(),
          instanceName: any(named: "instanceName"),
          dependsOn: any(named: "dependsOn"),
          signalsReady: any(named: "signalsReady"),
          dispose: any(named: "dispose"))).called(1);
    });

    test('unregister', () {
      when(getIt.unregister<String>).thenReturn("true");

      locator.unregister<String>();
      verify(() => getIt.unregister<String>()).called(1);
    });

    test('reset', () {
      when(getIt.reset).thenAnswer((_) async {});

      locator.reset();
      verify(() => getIt.reset()).called(1);
    });

    test('resetLazySingleton', () {
      when(getIt.resetLazySingleton<String>).thenAnswer((_) async {});

      locator.resetLazySingleton<String>();
      verify(() => getIt.resetLazySingleton<String>()).called(1);
    });

    test('resetScope', () {
      when(getIt.resetScope).thenAnswer((_) async {});

      locator.resetScope();
      verify(() => getIt.resetScope()).called(1);
    });

    test('signalReady', () {
      locator.signalReady(null);
      verify(() => getIt.signalReady(null)).called(1);
    });

    test('unregister', () {
      when(getIt.unregister<String>).thenAnswer((_) async {});

      locator.unregister<String>();
      verify(() => getIt.unregister<String>()).called(1);
    });

    test('registerRegistrar', () {
      final registrar = MockRegistrar();
      when(() => registrar.register(any())).thenAnswer((_) async {});

      locator.registerRegistrar(registrar);
      verify(() => registrar.register(any())).called(1);
      expect(locator.alreadyRegistered, contains(registrar.runtimeType));
    });
  });
}
