import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_clothes/constants/app_color.dart';
import 'package:hk_clothes/constants/controller.dart';
import 'package:hk_clothes/controllers/dashboard/account/account_controller.dart';
import 'package:shimmer/shimmer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            child: Ink(
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: CircleBorder(),
              ),
              child: IconButton(
                splashRadius: 25,
                icon: Badge(
                  badgeContent: Obx(
                    () => Text(
                      '${bagController.numberProductBag.value}',
                      style: TextStyle(
                        color: AppColors.app.shade200,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: AppColors.app[400],
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/bag");
                },
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Obx(
                  () => CachedNetworkImage(
                    imageUrl: authController.userInfor.value.photoUrl ??
                        "https://www.google.com/",
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 50,
                      backgroundImage: imageProvider,
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/icon/icon.png"),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.app,
                      ),
                      baseColor: AppColors.app[550],
                      highlightColor: Colors.grey[100],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      authController.userInfor.value != null
                          ? authController.userInfor.value.nickname
                          : "Nick Name",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/editprofile");
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              orderController.orders
                                  .where((element) => !element.delivered)
                                  .length
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('Order',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              productController.wishlist.length.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('Wish List',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TabBar(
            labelPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
              fontSize: 18,
              fontFamily: "UbuntuMono",
              fontWeight: FontWeight.bold,
            ),
            labelColor: AppColors.app,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 4.0,
                  style: BorderStyle.solid,
                  color: AppColors.app[400]),
              insets: EdgeInsets.symmetric(horizontal: size.width * 0.3),
            ),
            controller: accountController.tabController,
            tabs: accountController.listTabItem,
          ),
          Expanded(
            child: TabBarView(
              controller: accountController.tabController,
              children: accountController.listTab,
            ),
          ),
        ],
      ),
    );
  }
}
