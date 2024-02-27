class AppApiLinks {
  // static const String serverLink = "http://172.20.10.3/rimzoneshop";
  // static const String serverLink = "http://192.168.100.48/rimzoneshop";
  // static const String serverLink = "http://192.168.226.171/rimzoneshop";
  static const String serverLink =
      "https://rimzoneshop.000webhostapp.com/rimzoneshop";
  static const String test = "$serverLink/auth/test.php";
  // authenticate
  static const String signUp = "$serverLink/auth/signup.php";
  static const String checkEmailSignUp = "$serverLink/auth/checkemail.php";
  static const String phoneNumber = "$serverLink/auth/checkphonenumber.php";
  static const String verifyCodeSignUp = "$serverLink/auth/verifycode.php";
  static const String signIn = "$serverLink/auth/login.php";
  static const String resendEmail = "$serverLink/auth/resendemail.php";
  static const String forgetPassword =
      "$serverLink/auth/forgetpassword/checkemail.php";
  static const String verifyCodeReset =
      "$serverLink/auth/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$serverLink/auth/forgetpassword/resetpassword.php";
  // home
  static const String home = "$serverLink/home/home.php";
  // items
  static const String items = "$serverLink/items/items.php";
  // searchItems
  static const String searchItems = "$serverLink/search/searchitems.php";
  // itemsDetails
  static const String addItemToCart = "$serverLink/itemsdetails/addtocart.php";
  // favorite
  static const String favoriteAdd = "$serverLink/favorite/add.php";
  static const String favoriteRemove = "$serverLink/favorite/remove.php";
  static const String viewFavorite = "$serverLink/favorite/view.php";
  // cart
  static const String viewCart = "$serverLink/cart/view.php";
  static const String removeItemsFromCart = "$serverLink/cart/remove.php";
  static const String incrementQuantity = "$serverLink/cart/increment.php";
  static const String decrementQuantity = "$serverLink/cart/decrement.php";
  static const String checkCoupon = "$serverLink/coupon/checkcoupon.php";
  // checkout / orders
  static const String checkout = "$serverLink/checkout/checkout.php";
  static const String orders = "$serverLink/checkout/orders.php";
  static const String deleteOrder = "$serverLink/checkout/delete.php";
  static const String ordersDetails = "$serverLink/checkout/ordersdetails.php";
  // notifications_data
  static const String notificationsData = "$serverLink/notifications.php";
  // address
  static const String addAddress = "$serverLink/address/add.php";
  static const String viewAddress = "$serverLink/address/view.php";
  static const String deleteAddress = "$serverLink/address/delete.php";

  // network image
  static const String imageItems = "$serverLink/upload/items";
}
