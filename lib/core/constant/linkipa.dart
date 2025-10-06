class Applink {
  static const String server = "http://192.168.1.7/ecommerce";

  //test
  static const String test = "$server/auth/signup/sigin_up_with_google.php";
  //===============imagelink=======================================

  static const String imagestatic = "http://192.168.1.7/ecommerce/upload";
  static const String linkImageCategories = "$imagestatic/categoriesimage/";
  static const String linkImageItem = "$imagestatic/itemsimage/";
  static const String linkMultiImageItem = "$imagestatic/multiimageitem/";
  static const String linkVideoItem = "$imagestatic/video/";
  static const String linkImageUser = "$imagestatic/usersimages/";
  static const String linkImageChat = "$imagestatic/chatimage/";

  //===============sigup================================================
  static const String singup = "$server/auth/signup/signup.php";
  // static const String otpsigup = "$server/auth/signup/otpsignup.php";
  static const String otpsigup = "$server/auth/signup/otpsignup.php";
  static const String singUPWithGoogle =
      "$server/auth/signup/sigin_up_with_google.php";

  //=================login===============================================
  static const String login = "$server/auth/login/login.php";
  static const String otplogin = "$server/auth/login/otplogin.php";

  //====================forgetpass====================================
  static const String enteryouremail =
      "$server/auth/forgetpassword/enteryouremail.php";
  static const String otpForgetPassword =
      "$server/auth/forgetpassword/otpforgetpass.php";
  static const String newpassword =
      "$server/auth/forgetpassword/newpassword.php";

  //======================homescreen====================================

  static const String homepage = "$server/home/home.php";
  static const String itemsOfferPage = "$server/home/offer_items_page.php";

  //=======================itemsview====================================

  static const String itemsview = "$server/itemsview/items.php";
  static const String itemImages = "$server/itemsview/item_images.php";
  static const String itemVideo = "$server/itemsview/item_video.php";
  static const String reviewItem = "$server/itemsview/review_item.php";

  //=========================favorite=========================================

  static const String addFavorite = "$server/favorite/addfavorite.php";
  static const String removeFavorite = "$server/favorite/removefavorite.php";
  static const String viewFavorite = "$server/favorite/viewfavorite.php";
  static const String deletFavorite = "$server/favorite/deletfavorite.php";

  //========================cartAndCoupon================================================

  static const String addcart = "$server/cart/addcart.php";
  static const String deletcart = "$server/cart/deletcart.php";
  static const String countcart = "$server/cart/countcart.php";
  static const String viewcart = "$server/cart/viewcart.php";
  static const String addCoupon = "$server/coupon/coupon.php";
  static const String viewshop = "$server/checkout/viewshop.php";
  static const String checkout = "$server/checkout/checkout.php";

  //=============================search=======================================
  static const String search = "$server/search/search.php";

  //===================================loction========================
  static const String addLocation = "$server/location/addlocation.php";
  static const String viewLocation = "$server/location/viewlocation.php";
  static const String deleteLocation = "$server/location/deletelocation.php";

  //==============================order========================================

  //                           delivery
  static const String orderPendingApprovalDelivery =
      "$server/orders/delivery/orders_pending_approval_delivery.php";
  static const String orderStatePrepareDelivery =
      "$server/orders/delivery/orders_state_prepare_delivery.php";
  static const String ordersUnderDelivery =
      "$server/orders/delivery/orders_under_delivery.php";
  static const String orderDelivered =
      "$server/orders/delivery/orders_delivered.php";
  static const String acceptOrderDeliveryArchive =
      "$server/orders/delivery/accept_order_delivery_archive.php";

  //                       shop
  static const String orderPendingAprrovalShop =
      "$server/orders/shop/orders_pending_approval_shop.php";
  static const String orderUnderPrepareShop =
      "$server/orders/shop/order_underprepare_shop.php";
  static const String orderPrepareShop =
      "$server/orders/shop/order_prepared_shop.php";

  static const String ordersOnShope = "$server/orders/orders_onshope.php";
  static const String orderDetails = "$server/orders/order_details.php";
  static const String deleteOrder = "$server/orders/delete_order.php";
  static const String orderArchive = "$server/orders/orders_archive.php";
  static const String ratingOrder = "$server/orders/rating_order.php";
  static const String itemFoundOrNo = "$server/orders/item_found_or_no.php";
  static const String ratingItem = "$server/orders/rating_item.php";

  //===================================getNotification=======================
  static const String getNotification =
      "$server/notification/get_notification.php";
  static const String getNotificationNotRead =
      "$server/notification/notification_not_read.php";
  static const String readAllNotification =
      "$server/notification/read_all_notification.php";

  //=======================================imageMassege========================
  static const String imageMessage =
      "$server/messaging/add_image_messageing.php";
}
