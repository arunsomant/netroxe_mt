import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/modules/home/controllers/home_screen_controller.dart';
import 'package:netroxe/src/utils/app_styles.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';



  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Note App"),
      actions: [
        IconButton(onPressed: controller.logout, icon: const Icon(Icons.logout,color: AppColors.red,))
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Your Notes",style: AppTextStyles.appContentTitle),
          Obx((){
            if(controller.isBusy.isTrue){
              return const Center(child: CircularProgressIndicator());
            }
            if(controller.notes.isEmpty){
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Text("Add some notes to appear here"),
              );
            }
            return ListView.separated(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () => controller.gotoNoteEdit(controller.notes[index]),
                  title: Text(controller.notes[index].title!),
                  subtitle: Text(controller.notes[index].category!),
                  trailing: IconButton(onPressed: ()=> controller.delete(controller.notes[index]),icon: Icon(Icons.delete,color: AppColors.red,)),
                ),
              );
            }, separatorBuilder: (context, index) => const SizedBox(height: 10,), itemCount: controller.notes.length,shrinkWrap: true,);
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.gotoCreateNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
