import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileFormController extends GetxController {
  static ProfileFormController get instance => Get.find();

  var imagePath = ''.obs;
  XFile? imageFile;
  RxString dateOfBirth = 'Date of Birth'.obs;
  RxString dropDownValue = 'Gender'.obs;

  List<String> items = [
    'Gender',
    'Male',
    'Female',
  ];

  Future selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      imagePath.value = imageFile!.path;
    }
  }
}
