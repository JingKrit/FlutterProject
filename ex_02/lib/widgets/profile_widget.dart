import 'package:ex_02/app_service.dart';
import 'package:ex_02/controllers/user_controller.dart';
import 'package:ex_02/response/user_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  UserController userController = Get.put(UserController());

  Widget profileCard(UserResponse user) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(user.image!),
          ),
          Text(user.username!),
          Text(user.email!),
          Text(user.gender!),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => userController.user.value.username != null
              ? profileCard(userController.user.value)
              : const SizedBox.shrink()),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => {
              // Remove data from shared preferences
              AppService.instance.removeLogin(),
              // Go back to login screen
              context.replace('/')
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
