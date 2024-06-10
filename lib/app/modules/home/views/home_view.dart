import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nanoplan/app/routes/app_pages.dart';

import '../../../data/models/project.dart';
import '../../../widgets/header_sliver_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 90,
      //   flexibleSpace: FlexibleSpaceBar(
      //     collapseMode: CollapseMode.pin,
      //     background: Container(
      //       margin: const EdgeInsets.all(8),
      //       decoration: BoxDecoration(
      //         color: Theme.of(context).colorScheme.tertiary,
      //         borderRadius: BorderRadius.circular(24),
      //       ),
      //     ),
      //   ),
      //   title: Row(
      //     children: [
      //       const CircleAvatar(
      //         child: Text('AM'),
      //       ),
      //       const SizedBox(width: 8),
      //       Text(controller.appState.currentUser.value!.displayName),
      //       const Spacer(),
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.settings),
      //       ),
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          HeaderSliverBar(user: controller.appState.currentUser.value!),
          SliverList.list(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    'Manage your tasks'.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
            ],
          ),
          SliverList.list(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text(
                  'Task Title',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
            ],
          ),
          Obx(
            () => SliverList.builder(
              itemBuilder: (context, index) =>
                  ProjectCard(project: controller.projects[index]),
              itemCount: controller.projects.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: ValueKey(project.id),
                child: Text(
                  project.title ?? 'Project',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.PROJECT, arguments: project);
                    },
                    icon: Icon(
                      BootstrapIcons.arrow_up_right,
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
              )
            ],
          ),
          Text(
            project.description ?? '',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  overflow: TextOverflow.ellipsis,
                ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
