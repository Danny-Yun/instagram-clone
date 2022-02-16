import 'package:get/instance_manager.dart';
import 'package:instagram_clone/controller/NavigationController.dart';

class NavigationControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => NavigationController());
  }
}
