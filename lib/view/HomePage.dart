import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_demo/controller/Riverpod_Manager.dart';
import 'package:voco_demo/model/User.dart';
import 'package:voco_demo/sevices/NetworkService.dart';
import 'package:voco_demo/view/LoginPage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  NetworkService network = NetworkService();

  @override
  void initState() {
    initialOperations();

    super.initState();
  }

  void initialOperations() async {
    bool isLogged = await ref.read(authController).checkLoginStatus();
    if (isLogged) {
      ref.read(homeController).fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authController).isLogged
        ? Scaffold(
            body: ref.watch(homeController).isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: ref.watch(homeController).userList.length,
                    itemBuilder: (context, index) {
                      User user = ref.watch(homeController).userList[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(user.avatar),
                          title: Text(user.firstname + " " + user.lastname),
                          subtitle: Text(user.email),
                        ),
                      );
                    },
                  ),
          )
        : LoginPage();
  }
}
