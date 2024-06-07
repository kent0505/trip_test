import 'package:hive_flutter/hive_flutter.dart';

import '../models/plan.dart';

class PlanService {
  PlanService() {
    // Hive.registerAdapter(PlanAdapter());
  }

  List<Plan> plans = [];

  Future<List<Plan>> getPlans() async {
    final box = await Hive.openBox('mybox');
    List plans2 = box.get('plans') ?? [];
    plans = plans2.cast<Plan>();
    return plans;
  }

  Future<List<Plan>> updatePlans() async {
    final box = await Hive.openBox('mybox');
    box.put('plans', plans);
    plans = await box.get('plans');
    return plans;
  }
}
