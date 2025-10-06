import 'package:ecommerce/view/widget/myorder/delivery/oreder_tracking_map_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/services/mymiddleware.dart';
import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/screen/auth/forgetpass/enteryouremail.dart';
import 'package:ecommerce/view/screen/auth/forgetpass/newpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpass/otpforgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login/loginscreen.dart';
import 'package:ecommerce/view/screen/auth/login/otplogin.dart';
import 'package:ecommerce/view/screen/auth/signup/otpsignup.dart';
import 'package:ecommerce/view/screen/auth/signup/signup.dart';
import 'package:ecommerce/view/screen/cart/cart_screen.dart';
import 'package:ecommerce/view/screen/cart/checkout_screen.dart';
import 'package:ecommerce/view/screen/homescreen/homescreen.dart';
import 'package:ecommerce/view/screen/items/favorite_items_screen.dart';
import 'package:ecommerce/view/screen/items/items.dart';
import 'package:ecommerce/view/screen/items/items_details.dart';
import 'package:ecommerce/view/screen/items/review_item_screen.dart';
import 'package:ecommerce/view/screen/items/show_more_image.dart';
import 'package:ecommerce/view/screen/items/show_video_item_screen.dart';
import 'package:ecommerce/view/screen/language/language.dart';
import 'package:ecommerce/view/screen/messaging/current_user_messaging_screen.dart';
import 'package:ecommerce/view/screen/messaging/main_messaging_screen.dart';
import 'package:ecommerce/view/screen/notification/notification_screen.dart';
import 'package:ecommerce/view/screen/onbording/onboarding.dart';
import 'package:ecommerce/view/screen/orderscreen/my_order_archive_screen.dart';
import 'package:ecommerce/view/screen/orderscreen/my_order_shop_screen.dart';
import 'package:ecommerce/view/screen/setting/change_language_screen.dart';
import 'package:ecommerce/view/screen/setting/connect_us_screen.dart';
import 'package:ecommerce/view/screen/setting/location/add_location_screen.dart';
import 'package:ecommerce/view/screen/setting/location/my_location_screen.dart';
import 'package:ecommerce/view/screen/orderscreen/my_order_delivery_screen.dart';
import 'package:ecommerce/view/screen/orderscreen/order_detail_and_rating_screen.dart';
import 'package:ecommerce/view/screen/orderscreen/order_detail_screen.dart';

List<GetPage<dynamic>>? getPages = [
  ///////////////////////////////test////////////////
  GetPage(name: AppRoutes.test, page: () => const Testpage()),

  ////////////////////////////////////////////////////
  GetPage(
    name: AppRoutes.language,
    page: () => const Language(),
    middlewares: [Mymiddleware()],
  ),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),

  //========================loginroute=====================================
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.otplogin, page: () => const OtpLogin()),

  //========================signuproute====================================
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.otpsignup, page: () => const OtpSignUp()),

  //==========================resetpassroute===============================
  GetPage(name: AppRoutes.enteremail, page: () => const EnterYourEmail()),
  GetPage(name: AppRoutes.newpassword, page: () => const Newpassword()),
  GetPage(
    name: AppRoutes.otpforgetpassword,
    page: () => const OtpForgetPassword(),
  ),

  //==============================homepage=========================
  GetPage(name: AppRoutes.homescreen, page: () => const HomeScreen()),
  // GetPage(name: AppRoutes.settingPage, page: () => const SettingScreen()),

  //=============================items================================
  GetPage(name: AppRoutes.items, page: () => const Items()),

  GetPage(name: AppRoutes.itemsdetail, page: () => const ItemsDetails()),
  GetPage(name: AppRoutes.showMoreImage, page: () => const ShowMoreImage()),
  GetPage(name: AppRoutes.showVideo, page: () => const ShowVideoItemScreen()),
  GetPage(name: AppRoutes.reviewItem, page: () => const ReviewItemScreen()),

  GetPage(
    name: AppRoutes.favoriteitems,
    page: () => const FavoriteItemsScreen(),
  ),
  GetPage(name: AppRoutes.cartScreen, page: () => const CartScreen()),
  GetPage(name: AppRoutes.checkOut, page: () => const CheckoutScreen()),

  //====================================location========================
  GetPage(name: AppRoutes.mylocation, page: () => const MyLocationScreen()),
  GetPage(name: AppRoutes.addlocation, page: () => const AddLocationScreen()),

  //==================================myOrder=============================
  GetPage(
    name: AppRoutes.myOrderDelivery,
    page: () => const MyOrderDeliveryScreen(),
  ),
  GetPage(name: AppRoutes.myOrdershop, page: () => const MyOrderShopScreen()),

  GetPage(name: AppRoutes.orderDetail, page: () => const OrderDetailScreen()),
  GetPage(
    name: AppRoutes.orderDetailAndRating,
    page: () => const OrderDetailAndRatingScreen(),
  ),
  GetPage(
    name: AppRoutes.trackingOrder,
    page: () => const OrederTrackingMapScreen(),
  ),
  GetPage(
    name: AppRoutes.orderArchive,
    page: () => const MyOrderArchiveScreen(),
  ),
  //===================================notification==================
  GetPage(name: AppRoutes.notifScreen, page: () => const NotificationScreen()),

  // ==================================connact_us============================
  GetPage(name: AppRoutes.connactUs, page: () => const ConnectUsScreen()),
  GetPage(
    name: AppRoutes.changeLanguge,
    page: () => const ChangeLanguageScreen(),
  ),

  // ===================================messaging================================
  GetPage(
    name: AppRoutes.mainMessaging,
    page: () => const MainMessagingScreen(),
  ),
  GetPage(
    name: AppRoutes.currentmessageing,
    page: () => const CurrentUserMessagingScreen(),
  ),
];
