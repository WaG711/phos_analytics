import '../entities/financial_metric.dart';
import '../entities/production_metric.dart';
import '../entities/workforce_metric.dart';
import '../repositories/home_rpstr.dart';

class HomeUsecase {
  final HomeRpstr rpstr;

  HomeUsecase(this.rpstr);

  Future<FinancialMetric> executeFinancialMetric() async {
    return await rpstr.getFinancialMetric();
  }

  Future<ProductionMetric> executeProductionMetric() async {
    return await rpstr.getProductionMetric();
  }

  Future<WorkforceMetric> executeWorkforceMetric() async {
    return await rpstr.getWorkforceMetric();
  }
}
