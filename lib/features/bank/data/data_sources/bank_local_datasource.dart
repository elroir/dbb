import '../../domain/entities/bank.dart';

abstract interface class BankLocalDatasource{
  List<Bank> getBanks();
  void cacheBanks({List<Bank> banks});
}

class BankLocalDatasourceImpl implements BankLocalDatasource {

  /// Right now there is no persistence, so this list will be used as a cache

  List<Bank> _banks = [];

  @override
  List<Bank> getBanks() => _banks;

  @override
  void cacheBanks({List<Bank> banks = const []}) {
    _banks = banks;
  }

}
