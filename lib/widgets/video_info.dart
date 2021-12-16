import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter_youtube_ui/data.dart';

class DrawerModel extends ChangeNotifier {
  final _videoNames = [];

  void add(videoName) {
    _videoNames.add(videoName);
    notifyListeners();
  }

  void removeAll() {
    _videoNames.clear();
    notifyListeners();
  }
}

class VideoInfo extends StatelessWidget {
  final Video video;

  final Function changeLikedVideos;

  const VideoInfo({
    Key? key,
    required this.video,
    required this.changeLikedVideos
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${video.viewCount} views • ${timeago.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          const Divider(),
          ActionsRow(video: video, changeLikedVideos: changeLikedVideos),
          const Divider(),
          _AuthorInfo(user: video.author),
          const Divider(),
        ],
      ),
    );
  }
}

class ActionsRow extends StatefulWidget {
  final Video video;
  final Function changeLikedVideos;

  ActionsRow({ required this.video, required this.changeLikedVideos });

  @override
  _ActionsRow createState() => _ActionsRow(video: video, changeLikedVideos: changeLikedVideos);
}

class _ActionsRow extends State<ActionsRow> {
  final Video video;
  final Function changeLikedVideos;
  bool _isLiked = false;

  _ActionsRow({required this.video, required this.changeLikedVideos});

  void setIsLiked() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes, 1),
        _buildAction(context, Icons.thumb_down_outlined, video.dislikes, 2),
        _buildAction(context, Icons.reply_outlined, 'Share', 3),
        _buildAction(context, Icons.download_outlined, 'Download', 4),
        _buildAction(context, Icons.library_add_outlined, 'Save', 5),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(icon),
            color: (_isLiked && index == 1) ? Colors.pinkAccent : Colors.white,
            onPressed: () {
              changeLikedVideos(_isLiked);
              setIsLiked();
              Provider.of<DrawerModel>(context, listen: false).add(video.title);
            },
          ),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Navigate to profile'),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(user.profileImageUrl),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    user.username,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.0),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${user.subscribers} subscribers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'SUBSCRIBE',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}

class ListOfVideos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerModel>(
      builder: (context, myModel, child) {
        return Column(
          children: <Widget>[
            Text('Added Videos: '),
            for(var item in myModel._videoNames) Text(item),
            if(myModel._videoNames.isNotEmpty) Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () => {
                    myModel.removeAll()
                  },
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Remove videos",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
