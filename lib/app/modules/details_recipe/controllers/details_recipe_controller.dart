import 'package:get/get.dart';
import 'package:my_recipe/app/data/models/Search.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsRecipeController extends GetxController {

  Hits hitsModel = Hits();
  @override
  void onInit() {
    super.onInit();
    hitsModel = Get.arguments;

    print(hitsModel.recipe!.image);
  }


    Future launchUrl(String url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }



}
