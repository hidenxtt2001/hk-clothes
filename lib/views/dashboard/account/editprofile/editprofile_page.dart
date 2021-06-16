import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_clothes/constants/app_color.dart';
import 'package:hk_clothes/constants/controller.dart';
import 'package:hk_clothes/controllers/auth/auth_controller.dart';
import 'package:hk_clothes/views/dashboard/account/widget/editprofile_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: AppColors.app[400],
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      //container , padding , row
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.app[550],
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EditProfile(
                    title: "Change your photo",
                    widget: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            color: AppColors.app.shade400,
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage(
                                    'assets/images/logo_splash.png')))),
                    function: 1),
                Divider(thickness: 2),
                EditProfile(
                  title: "First Name",
                  widget: Text(authController.userInfor.firstName,
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.app[500],
                          fontWeight: FontWeight.bold)),
                  function:  2,
                ),
                Divider(thickness: 2),
                EditProfile(
                    title: "Last Name",
                    widget: Text(authController.userInfor.lastName,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.app[500],
                            fontWeight: FontWeight.bold)),
                    function: 3),
                Divider(thickness: 2),
                EditProfile(
                    title: "Nickname",
                    widget: Text(authController.userInfor.nickname,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.app[500],
                            fontWeight: FontWeight.bold)),
                    function: 4),
                Divider(thickness: 2),
                EditProfile(
                    title: "Gender",
                    widget: Text(authController.userInfor.gender,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.app[500],
                            fontWeight: FontWeight.bold)),
                    function: 5),
                Divider(thickness: 2),
                EditProfile(
                    title: "Birthday",
                    widget: Text(authController.userInfor.birthday,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.app[500],
                            fontWeight: FontWeight.w600)),
                    function: 6),
                Divider(thickness: 2),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Done",
                            style: TextStyle(fontSize: 24),
                          ),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
