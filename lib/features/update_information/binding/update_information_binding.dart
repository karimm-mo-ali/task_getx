part of update_information;

class UpdateInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateInformationController());
  }
}
