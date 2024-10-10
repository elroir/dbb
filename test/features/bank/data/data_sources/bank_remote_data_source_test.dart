import 'package:dbb/features/bank/data/data_sources/bank_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pocketbase/pocketbase.dart';

class MockPocketBaseClient extends Mock implements PocketBase {}

void main() {
  late MockPocketBaseClient pb;
  late BankRemoteDatasource remoteDatasource;

  setUp(() {
    pb = MockPocketBaseClient();
    remoteDatasource = BankRemoteDatasourceImpl(pb: pb);
  });

  // void setUpMockHttpClientSuccess200() {
  //   when(pb.collection(argThat(isNotNull,named: 'bank')).getList(
  //       expand: 'data_source',
  //       fields: 'id,name,created,icon,code,url,expand.data_source.name,expand.data_source.url'
  //   )).thenAnswer((_) async => []);
  // }
}
