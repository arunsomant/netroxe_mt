import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/model/note.dart';
import 'package:netroxe/src/modules/note/controllers/note_controller.dart';
import 'package:netroxe/src/modules/register/controllers/register_screen_controller.dart';
import 'package:netroxe/src/utils/app_styles.dart';

class NoteCreateScreen extends StatelessWidget {
  NoteCreateScreen({Key? key}) : super(key: key);
  static const routeName = '/note_create';
  final controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(controller.note.value == null ? "Create note" : "Edit Note"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.titleController,
                  decoration:
                      const InputDecoration(hintText: "Enter note title"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.contentController,
                  minLines: 5,
                  maxLines: 6,
                  decoration:
                      const InputDecoration(hintText: "Enter your note"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid note";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx((){
                  return Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: List.generate(
                        Note.categories.length,
                            (index) => ChoiceChip(
                              onSelected: (value) {
                                if(value) controller.selectedCategory(Note.categories[index]);
                              },
                            label: Text(Note.categories[index]),
                            selected: Note.categories[index] ==
                                controller.selectedCategory.value)),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  return MaterialButton(
                    onPressed:
                        controller.isBusy.isTrue ? null : controller.createOrEdit,
                    color: AppColors.primary,
                    child: controller.isBusy.isTrue
                        ? const CircularProgressIndicator()
                        : Text(controller.note.value == null ? "Create Note" : "Update Note"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
