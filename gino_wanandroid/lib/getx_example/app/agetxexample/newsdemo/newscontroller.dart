import 'package:get/get.dart';

import 'api_news.dart';
import 'model_news.dart';

class MovieController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var movieList = <MovieModel>[].obs; //数据更新监听

  @override
  void onInit() {
    // TODO: implement onInit
    fetchMovie();
    super.onInit();
  }

  void fetchMovie() async {
    try {
      isLoading(true);
      //获取数据
      var movie = await ApiService.fetchMovie();
      if (movie != null) {
        //数据填充
        movieList.assignAll(movie as Iterable<MovieModel>);
      }
    } finally {
      isLoading(false);
    }
  }
}