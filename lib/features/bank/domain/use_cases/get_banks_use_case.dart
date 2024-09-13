import '../entities/bank.dart';
import '../repositories/bank_repository.dart';

class GetBanks {
  final BankRepository _repository;

  GetBanks({required BankRepository repository}) : _repository = repository;

  List<Bank> call() => _repository.getBanks();


}