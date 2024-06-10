import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/project.dart';
import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  ProjectView({super.key});

  final Project project = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: ValueKey(project.id),
                child: Text(
                  '${project.title}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
