import 'package:get/get.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/controller/book_a_consultation_binding.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/book_a_consultation_screen.dart';
import 'package:maindmate/features/Consultations/book_now/controller/book_now_binding.dart';
import 'package:maindmate/features/Consultations/book_now/view/book_now_screen.dart';
import 'package:maindmate/features/auth/sign_in/controller/sign_in_binding.dart';
import 'package:maindmate/features/auth/sign_in/view/sign_in_screen.dart';
import 'package:maindmate/features/auth/sign_up/controller/sing_up_binding.dart';
import 'package:maindmate/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:maindmate/features/auth/welcome_screen/view/welcome_screen.dart';
import 'package:maindmate/features/experience/experience_detailes/controller/experience_detailes_binding.dart';
import 'package:maindmate/features/experience/experience_detailes/view/experience_detailes_screen.dart';
import 'package:maindmate/features/experience/experience_of_others/controller/experience_of_others_binding.dart';
import 'package:maindmate/features/experience/experience_of_others/view/experience_of_others_screen.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/controller/select_group_therapy_binding.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/view/select_group_therapy_screen.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/controller/main_bottom_navigation_binding.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/view/main_bottom_navigation_widget.dart';
import 'package:maindmate/features/payment/add_payment_card/controller/add_payment_card_binding.dart';
import 'package:maindmate/features/payment/add_payment_card/view/add_payment_card_screen.dart';
import 'package:maindmate/features/payment/confirm_payment/controller/confirm_payment_binding.dart';
import 'package:maindmate/features/payment/confirm_payment/view/confirm_payment_view.dart';

appRoutes() => [
      GetPage(
        name: '/WelcomeScreen',
        page: () => WelcomeScreen(),
      ),
      GetPage(
          name: '/MainBottomNavigationBarWidget',
          page: () => MainBottomNavigationBarWidget(),
          binding: MainBottomNavigationBinding()),
      GetPage(
          name: '/SignUpScreen',
          page: () => SignUpScreen(),
          binding: SignUpBinding()),
      GetPage(
          name: '/SignInScreen',
          page: () => SignInScreen(),
          binding: SignInBinding()),
      GetPage(
          name: '/ExperienceOfOthersScreen',
          page: () => const ExperienceOfOthersScreen(),
          binding: ExperienceOfOThersBinding()),
      GetPage(
          name: '/BookAConsultationScreen',
          page: () => const BookAConsultationScreen(),
          binding: BookAConsultationBinding()),
      GetPage(
          name: '/BookNowScreen',
          page: () => const BookNowScreen(),
          binding: BookNowBinding()),
      GetPage(
          name: '/ExperienceDetailesScreen',
          page: () => const ExperienceDetailesScreen(),
          binding: ExperienceDetailesBinding()),
      GetPage(
          name: '/SelectGroupTherapyScreen',
          page: () => const SelectGroupTherapyScreen(),
          binding: SelectGroupTherapyBinding()),
      GetPage(
          name: '/AddPaymentCardScreen',
          page: () => const AddPaymentCardScreen(),
          binding: AddPaymentCardBinding()),
      GetPage(
          name: '/ConfirmPaymentScreen',
          page: () => const ConfirmPaymentScreen(),
          binding: ConfirmPaymentBinding())
    ];
