class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Luka Lysenko',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AKedOLTctGKJ32CdDLiSZ64JyktSvRZWMo6v7TTj5Gx_IA=s68-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'BEST OF HENRIK HARLAUT XGames Knuckle Huck 2021',
    thumbnailUrl: 'https://i.ytimg.com/vi/98CSStSEcAU/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC-e3SWbTbs7QTHaYKBtajZVhm-aw',
    duration: '3:57',
    timestamp: DateTime(2021, 12, 25),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
        'How to create an awesome navigation bar with HTML & CSS',
    thumbnailUrl: 'https://i.ytimg.com/vi/FEmysQARWFU/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBlxFf_wqZwKQKChMJar5df9qSfbg',
    duration: '26:42',
    timestamp: DateTime(2021, 12, 20),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: '456,000 Squid Game In Real Life!',
    thumbnailUrl: 'https://i.ytimg.com/vi/0e3GPea1Tyg/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBS2AvEddXCN6YbcE6YvKjKAuxPSQ',
    duration: '25:42',
    timestamp: DateTime(2020, 11, 29),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Соник 2 в кино — Русский трейлер (2022)',
    thumbnailUrl: 'https://i.ytimg.com/vi/2iWDlZGa8M0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA2Heb6sZem-HPDNyq6rgICdDDkog',
    duration: '2:18',
    timestamp: DateTime(2021, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Гриффины #295 Лучшие и смешные моменты HD(Детство Питера)',
    thumbnailUrl: 'https://i.ytimg.com/vi/T8XopxJpX3s/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCQX7HizaOLu0Uiez9LcGFZXCmoLw',
    duration: '10:05',
    timestamp: DateTime(2021, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Warhammer 40,000 Space Marine 2 – Official Reveal Trailer | Game Awards 2021',
    thumbnailUrl: 'https://i.ytimg.com/vi/j7AHXf7_A4M/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBGJxzs_7a2aPqFf0kxjT2Rhg3ydw',
    duration: '4:02',
    timestamp: DateTime(2020, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
];
