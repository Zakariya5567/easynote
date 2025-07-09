import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
  ];
}
