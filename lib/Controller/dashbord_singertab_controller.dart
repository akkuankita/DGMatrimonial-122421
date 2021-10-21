// import 'package:eventmangement_app/Model/all_singer_with_music_list.dart';
// import 'package:eventmangement_app/Model/tranding_music_model.dart';
// import 'package:eventmangement_app/services/Networkcall.dart';
// import 'package:eventmangement_app/util/constant.dart';
// import 'package:get/get.dart';

// class DashbordSingerTabController extends GetxController {
//   var isLoading = true.obs;
//   var singerWithMusicList = SingerWithMusicList().obs;
//   var listOfSinger = List<SingerList>().obs;

//   // >>>>>>>>>>> TrandingMusicList <<<<<<<<<<<<<<<<<
//   var trandingSingerList = TrandingMusicModel().obs;
//   var listOfTrandingSinger = List<TrandingSingerDetails>().obs;

//   // >>>>>>>>>>> fetchSingerWithMusicList <<<<<<<<<<<<<<<<<
//   fetchSingerWithMusicList() async {
//     try {
//       isLoading.value = true;
//       singerWithMusicList.value = await Networkcall().fetchSingerWithMusicList();
//       listOfSinger.assignAll(singerWithMusicList.value.data);

//       // >>>>>>>>>>> fetchTrandingMusicList <<<<<<<<<<<<<<<<<
//       trandingSingerList.value = await Networkcall().fetchTrandingMusic();
//       listOfTrandingSinger.assignAll(trandingSingerList.value.data);
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       if (e.isNetworkError != null && e.isNetworkError) {
//         showToast(e.customMessage, red);
//       } else {
//         showToast(e.customMessage, red);
//       }
//     }
//   }

//   // >>>>>>>>>>> postLike <<<<<<<<<<<<<<<<<
//   postLike(userId, index) async {
//     try {
//       // isLoading.value = true;
//       var response = await Networkcall().postLike(userId);
//       listOfSinger[index].myLikes = response["status"];
//       listOfSinger[index].totalLikes = response["total_likes"];
//       listOfSinger.refresh();

//     } catch (e) {
//       // isLoading.value = false;
//       if (e.isNetworkError != null && e.isNetworkError) {
//         showToast(e.customMessage, red);
//       } else {
//         showToast(e.customMessage, red);
//       }
//     }
//   }

// }
