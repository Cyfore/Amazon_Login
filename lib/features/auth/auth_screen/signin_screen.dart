library signin_screen;

import 'package:amazon_clone_app/common/widgets/radio_list_tile/custom_radio_list_tile.dart';
import 'package:amazon_clone_app/common/widgets/textfield/custom_textfiled.dart';
import 'package:amazon_clone_app/constants/consts.dart';
import 'package:amazon_clone_app/controllers/auth_controller.dart';
import 'package:amazon_clone_app/features/auth/auth_constants/auth_constants.dart';

import '../../../common/widgets/text/custom_bold_text.dart';
import 'auth_appbar.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: Padding(
        padding: const ScreenPadding.all(),
        child: GetBuilder<AuthController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBoldText(text: AppConstants.welcome),
              CustomRadioListTile(
                text: AuthConstants.createAccount,
                value: Auth.signup,
                groupValue: controller.auth,
                onChanged: (val) {
                  controller.radioOnChanged(val);
                  controller.authRoute(false);
                },
              ),
              if (controller.auth == Auth.signup && controller.authRoute.value == false)
                Form(
                    key: _signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBoldText(text: AuthConstants.userSurAndName, fontSize: AuthConstants.twenty),
                        CustomTextFormField(controller: emailcontroller),
                        10.heightBox,
                        const CustomBoldText(text: AuthConstants.emailOrPhone, fontSize: AuthConstants.twenty),
                        CustomTextFormField(controller: emailcontroller),
                        10.heightBox,
                        const CustomBoldText(text: AuthConstants.creatPassword, fontSize: AuthConstants.twenty),
                        CustomTextFormField(controller: emailcontroller),
                        
                      ],
                    )),
              CustomRadioListTile(
                text: AuthConstants.signinAccount,
                value: Auth.signin,
                groupValue: controller.auth,
                onChanged: (val) {
                  controller.radioOnChanged(val);
                  controller.authRoute(true);
                },
              ),
              if (controller.auth == Auth.signin && controller.authRoute.value == true)
                Form(
                    key: _signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBoldText(text: AuthConstants.emailOrPhone, fontSize: AuthConstants.twenty),
                        CustomTextFormField(controller: emailcontroller),
                      ],
                    )),
            ],
          ),
        ),
      ),
    );
  }
}