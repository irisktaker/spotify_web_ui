import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/views/screens/playlist_screen.dart';
import 'package:spotify/views/widgets/widgets.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) const SideMenu(),
                const Expanded(
                    child: PlayListScreen(playlist: lofihiphopPlaylist)),
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}
