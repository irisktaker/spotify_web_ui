import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            iconData: Icons.home,
            title: "Home",
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.search,
            title: "Search",
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: "Radio",
            onTap: () {},
          ),
          const SizedBox(height: 12.0),
          _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylist> createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<_LibraryPlaylist> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // showing the scroll bar on side
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "YOUR LIBRARY",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // spreader operator
                ...yourLibrary
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "PLAYLIST",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // spreader operator
                ...playlists
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
