import 'package:get_it/get_it.dart';
import 'package:lista_filmes/screens/controller/home_controller.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  getIt.registerSingleton<HomeController>(HomeController());
}
