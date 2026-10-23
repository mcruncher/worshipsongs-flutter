import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';
import 'package:worship_songs/utils/providers/database_provider.dart';

void main() {
  group("DatabaseServiceImplTest", () {
    setUpAll(() {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    test("Get database", () async {
      // setup
      var providerContainer = ProviderContainer.test();

      // when
      var read = await providerContainer.read(databaseProvider.future);

      // then
      expect(read.isOpen, true);
    });
  });
}
