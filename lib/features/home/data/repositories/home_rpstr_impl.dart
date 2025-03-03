import '../../domain/entities/financial_metric.dart';
import '../../domain/entities/production_metric.dart';
import '../../domain/entities/workforce_metric.dart';
import '../../domain/repositories/home_rpstr.dart';

class HomeRpstrImpl implements HomeRpstr {
  @override
  Future<FinancialMetric> getFinancialMetric() {
    // TODO: implement getFinancialMetric
    throw UnimplementedError();
  }

  @override
  Future<ProductionMetric> getProductionMetric() {
    // TODO: implement getProductionMetric
    throw UnimplementedError();
  }

  @override
  Future<WorkforceMetric> getWorkforceMetric() {
    // TODO: implement getWorkforceMetric
    throw UnimplementedError();
  }
}