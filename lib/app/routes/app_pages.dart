import 'package:get/get.dart';

import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detailewaste/bindings/detailewaste_binding.dart';
import '../modules/detailewaste/views/detailewaste_view.dart';
import '../modules/detailglass/bindings/detailglass_binding.dart';
import '../modules/detailglass/views/detailglass_view.dart';
import '../modules/detailmetal/bindings/detailmetal_binding.dart';
import '../modules/detailmetal/views/detailmetal_view.dart';
import '../modules/detailpaper/bindings/detailpaper_binding.dart';
import '../modules/detailpaper/views/detailpaper_view.dart';
import '../modules/detailplastic/bindings/detailplastic_binding.dart';
import '../modules/detailplastic/views/detailplastic_view.dart';
import '../modules/detection/bindings/detection_binding.dart';
import '../modules/detection/views/detection_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/update_profile/bindings/update_profile_binding.dart';
import '../modules/update_profile/views/update_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.DETECTION,
      page: () => DetectionView(),
      binding: DetectionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPLASTIC,
      page: () => DetailplasticView(),
      binding: DetailplasticBinding(),
    ),
    GetPage(
      name: _Paths.DETAILGLASS,
      page: () => DetailglassView(),
      binding: DetailglassBinding(),
    ),
    GetPage(
      name: _Paths.DETAILMETAL,
      page: () => DetailmetalView(),
      binding: DetailmetalBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPAPER,
      page: () => DetailpaperView(),
      binding: DetailpaperBinding(),
    ),
    GetPage(
      name: _Paths.DETAILEWASTE,
      page: () => DetailewasteView(),
      binding: DetailewasteBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => const UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
