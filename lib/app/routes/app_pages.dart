import 'package:musix_final/app/modules/bookmark/bookmark_view.dart';
import 'package:musix_final/app/modules/bookmark/bookmark_binding.dart';
import 'package:musix_final/app/modules/track/track_view.dart';
import 'package:musix_final/app/modules/track/track_binding.dart';
import 'package:musix_final/app/modules/home/home_view.dart';
import 'package:musix_final/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.TRACK, 
      page:()=> TrackView(), 
      binding: TrackBinding(),
    ),
    GetPage(
      name: Routes.BOOKMARK, 
      page:()=> BookmarkView(), 
      binding: BookmarkBinding(),
    ),
  ];
}