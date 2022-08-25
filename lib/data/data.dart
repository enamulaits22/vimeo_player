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
  username: 'Marcus Ng',
  profileImageUrl: 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final String timestamp;
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
  const Video(
    id: '733991527',
    author: currentUser,
    title: 'McDonald’s Weddings (Director’s Cut)',
    thumbnailUrl: 'https://i.vimeocdn.com/video/1429912575-e25bf100504cacc17725094c022ba61c641269eee58ebe740d75546c893fe90f-d_640',
    duration: '1:26',
    timestamp: '3 months ago',
    viewCount: '46.5K',
    likes: '1037',
    dislikes: '4',
  ),
  const Video(
    id: '234582800',
    author: currentUser,
    title: 'Mister-Blue-Groot !',
    thumbnailUrl: 'https://i.vimeocdn.com/video/656195152-bb7b759db1a4b3b6dc79968a11e384694e8024adb3fe8653c1704c3219842036-d_640',
    duration: '2:58',
    timestamp: '5 years ago',
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
  const Video(
    author: currentUser,
    id: '358296408',
    title: 'Subtitles and captions overview',
    thumbnailUrl: 'https://i.vimeocdn.com/video/811882483-57dbdd3704f6540ad01870c53372711add51b491b3f4da232faaad3a903f65d8-d_640',
    duration: '1:19',
    timestamp: '3 years ago',
    viewCount: '5k',
    likes: '102',
    dislikes: '80',
  ),
  const Video(
    author: currentUser,
    id: '740426857',
    title: 'FORD - SCARY FAST - DIRECTOR’S CUT',
    thumbnailUrl: 'https://i.vimeocdn.com/video/1489970027-e37bfdeecb0c5738b4295a7ff32a8af24ac19d15ac2d5197e2eefdf4daeefa71-d_640',
    duration: '2:06',
    timestamp: '5 days ago',
    viewCount: '86K',
    likes: '201',
    dislikes: '80',
  ),
  //This is a private video
  const Video(
    author: currentUser,
    id: '742197098',
    title: '(Private)Alaska in 8K 60p HDR (Dolby Vision)',
    thumbnailUrl: 'https://i.vimeocdn.com/video/1493393614-2a704ac1ed69d63175d90a47774e2b3d3cf91c2492275f36504c5715fc5b6e65-d_640',
    duration: '1:47',
    timestamp: '1 days ago',
    viewCount: '78K',
    likes: '201',
    dislikes: '80',
  ),
];

final List<Video> suggestedVideos = [
  const Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: '5 days ago',
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  const Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
    duration: '1:52:12',
    timestamp: '5 days ago',
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  const Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
    duration: '1:03:58',
    timestamp: '5 days ago',
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
];
