import 'package:flutter/material.dart';

import '../data/models/user.dart';

class HeaderSliverBar extends StatelessWidget {
  const HeaderSliverBar({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 4,
      toolbarHeight: 64,
      title: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Text('AM'),
            ),
            const SizedBox(width: 8),
            Text(
              user.displayName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      expandedHeight: 70,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(32),
          ),
          // child: Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          //     child: Text(
          //       'Manage your tasks'.tr,
          //       style: Theme.of(context).textTheme.displayLarge,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
