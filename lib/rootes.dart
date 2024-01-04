import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/middleware/appmiddleware.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/view/screen/address/address.dart';
// import 'package:rimzone_shop/test_view.dart';
import 'package:rimzone_shop/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:rimzone_shop/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:rimzone_shop/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:rimzone_shop/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:rimzone_shop/view/screen/auth/signin.dart';
import 'package:rimzone_shop/view/screen/auth/join.dart';
import 'package:rimzone_shop/view/screen/auth/signup/createaccount.dart';
import 'package:rimzone_shop/view/screen/auth/signup/success_signup.dart';
import 'package:rimzone_shop/view/screen/auth/signup/verifycode_signup.dart';
import 'package:rimzone_shop/view/screen/cart.dart';
import 'package:rimzone_shop/view/screen/checkout/checkout.dart';
import 'package:rimzone_shop/view/screen/favorites.dart';
import 'package:rimzone_shop/view/screen/items.dart';
import 'package:rimzone_shop/view/screen/home.dart';
import 'package:rimzone_shop/view/screen/defaulthomepage.dart';
import 'package:rimzone_shop/view/screen/itemsdetails.dart';
import 'package:rimzone_shop/view/screen/language.dart';
import 'package:rimzone_shop/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rimzone_shop/view/screen/orders/orders.dart';
import 'package:rimzone_shop/view/screen/orders/orders_details.dart';
import 'package:rimzone_shop/view/screen/orders/orders_product_details.dart';

class AppGetPageRoutes {
  AppServices appServices = Get.find();
  static List<GetPage<dynamic>>? routes = [
    // GetPage(
    //   name: "/",
    //   page: () => const TestView(),
    // ),
    GetPage(
      name: AppRoutes.language,
      page: () => const Language(),
      middlewares: [
        AppMiddleWare(),
      ],
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignIn(),
    ),
    GetPage(
      name: AppRoutes.JoinApp,
      page: () => const JoinApp(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoarding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordAuth(),
    ),
    GetPage(
      name: AppRoutes.verifyCode,
      page: () => const VerifyCode(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPassword(),
    ),
    GetPage(
      name: AppRoutes.verifyCodeSignUp,
      page: () => const VerifyCodeSignUp(),
    ),
    GetPage(
      name: AppRoutes.createUsername,
      page: () => const CreateAccount(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const Home(),
    ),
    GetPage(
      name: AppRoutes.successSignUp,
      page: () => const SuccessSignUp(),
    ),
    GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const DefaultHomePage(),
    ),
    GetPage(
      name: AppRoutes.items,
      page: () => const Items(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: AppRoutes.itemsDetails,
      page: () => const ItemsDetails(),
    ),
    GetPage(
      name: AppRoutes.viewFavorite,
      page: () => const FavoriteDefaultHomePage(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const Cart(),
    ),
    GetPage(
      name: AppRoutes.viewAddress,
      page: () => const AddressView(),
    ),
    GetPage(
      name: AppRoutes.checkOut,
      page: () => const CheckOut(),
    ),
    GetPage(
      name: AppRoutes.viewOrders,
      page: () => const ViewOrders(),
    ),
    GetPage(
      name: AppRoutes.viewOrdersDetails,
      page: () => const OrdersDetails(),
    ),
    GetPage(
      name: AppRoutes.viewProductOrderDetails,
      page: () => const OrdersProductDetails(),
    ),
  ];
}

// Ahmedou SALEM : Flutter Dev
