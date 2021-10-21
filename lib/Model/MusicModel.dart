import 'dart:convert';

class MusicModel {
  String? status;
  List<AllMusic>? data;
  String? message;

  MusicModel({this.status, this.data, this.message});

  MusicModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AllMusic>[];
      json['data'].forEach((v) {
        data!.add(new AllMusic.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class AllMusic {
  // for easy perpose I make playListId so that I can use it in playlist and other music
  int? playListId;
  int? audioId;
  String? songTitle, type;
  String? artistName;
  String? writerName;
  String? musicByWho;
  String? thubmnail;
  String? audioUrl;
  String? category;
  String? albumName;
  String? albumImage;
  String? like;
  String? totalLikes;

  AllMusic(
      {this.playListId,
      this.audioId,
      this.songTitle,
      this.artistName,
      this.writerName,
      this.musicByWho,
      this.thubmnail,
      this.audioUrl,
      this.category,
      this.albumName,
      this.like,
      this.totalLikes,
      this.type,
      this.albumImage});

  AllMusic.fromJson(Map<String, dynamic> json) {
    playListId = json['id'];
    audioId = json['audio_id'];
    songTitle = json['song_title'];
    type = json['type'];
    artistName = json['artist_name'];
    writerName = json['writer_name'];
    musicByWho = json['music_by_who'];
    thubmnail = json['thubmnail'];
    audioUrl = json['audio_url'];
    category = json['category'];
    albumName = json['album_name'];
    albumImage = json['album_image'];
    like = json['like'];
    totalLikes =
        json['total_likes'] != null ? json['total_likes'].toString() : '0';
  }
 static Map<String, dynamic> toMap(AllMusic music) => {
        'id' : music.playListId,
    'audio_id' : music.audioId,
    'song_title' : music.songTitle,
    'type' : music.type,
    'artist_name' : music.artistName,
    'writer_name' : music.writerName,
    'music_by_who' : music.musicByWho,
    'thubmnail' :music.thubmnail,
    'audio_url' :music.audioUrl,
    'category' :music.category,
    'album_name' : music.albumName,
    'album_image' :music.albumImage,
    'like' :music.like,
    'total_likes' :
        music.totalLikes
      };
  static String encode(List<AllMusic> music) => jsonEncode(music.map((e) => AllMusic.toMap(e)).toList());

  static List<AllMusic> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<AllMusic>((item) => AllMusic.fromJson(item))
          .toList();
}
