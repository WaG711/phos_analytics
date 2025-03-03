import '../entities/financial_metric.dart';
import '../entities/production_metric.dart';
import '../entities/workforce_metric.dart';

abstract class HomeRpstr {
  Future<FinancialMetric> getFinancialMetric();
  Future<ProductionMetric> getProductionMetric();
  Future<WorkforceMetric> getWorkforceMetric();
}