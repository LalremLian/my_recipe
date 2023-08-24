import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../global_widgets/recipe_card_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity,
              MediaQuery.of(context).padding.top + kToolbarHeight),
          child:
          Container(
            padding: const EdgeInsets.only(top: 40.0, bottom: 0.0, left: 10.0),
            decoration: BoxDecoration(
              border: const Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xffe1e0e0),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff7EEF03),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: "Search recipes",
                        contentPadding:
                            const EdgeInsets.only(left: 24.0, bottom: 8.0, top: 6.0),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: homeController.searchController.clear,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        homeController.getAttendanceData(value);
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(bottom: 8.0, left: 10.0, right: 10.0),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Obx(() => (controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : (controller.attendanceModel.hits == null
                ? const Center(child: Text('Search your desired recipe'))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, bottom: 8.0),
                          child: Divider(
                            height: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Divider(
                            height: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              homeController.attendanceModel.hits!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAILS_RECIPE,
                                    arguments: homeController
                                        .attendanceModel.hits![index]);
                              },
                              child: RecipeCard(
                                homeController: homeController,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )))));
  }
}
