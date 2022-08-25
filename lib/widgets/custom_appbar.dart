import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.network('https://cutewallpaper.org/24/vimeo-logo-png/vimeo-on-demand-logo-png-transparent-png-672x288-free-download-on-nicepng.png'),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 40.0,
          icon: const CircleAvatar(
            foregroundImage: NetworkImage("https://enamulhaque028.github.io/profile/img/profile.jpg"),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
