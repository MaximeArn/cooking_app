import 'package:camera/camera.dart';
import 'package:cooking/firebase_options.dart';
import 'package:cooking/providers/auth.dart';
import 'package:cooking/providers/groups.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/providers/rewards.dart';
import 'package:cooking/providers/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:cooking/themes.dart';
import 'package:cooking/utils.dart';

import 'package:cooking/views/auth/auth.dart';
import 'package:cooking/views/auth/widgets/forgot_password.dart';
import 'package:cooking/views/auth/widgets/verify_email.dart';
import 'package:cooking/views/drawer_pages/settings/settings.dart';
import 'package:cooking/views/edit_profile/edit_profile.dart';
import 'package:cooking/views/groups/create_group/add_members.dart';
import 'package:cooking/views/groups/group_detail/group_settings/group_settings.dart';
import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:cooking/views/groups/group_detail/group_detail.dart';
import 'package:cooking/views/not_found/not_found.dart';
import 'package:cooking/views/search_page/search_page.dart';
import 'package:cooking/widgets/loader.dart';

List<CameraDescription> cameras = [];

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    cameras = await availableCameras();
  } catch (e) {}
  runApp(Cooking());
}

class Cooking extends StatefulWidget {
  @override
  _CookingState createState() => _CookingState();
}

class _CookingState extends State<Cooking> {
  final rewardsProvider = RewardsProvider();
  final postsProvider = PostsProvider();
  final usersProvider = UsersProvider();

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    rewardsProvider.fetchRewards();
    postsProvider.fetchPosts();
    usersProvider.getNationalRanking();
    await usersProvider.getUserByEmail(
        email: firebase.FirebaseAuth.instance.currentUser!.email as String);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: usersProvider),
        ChangeNotifierProvider.value(value: rewardsProvider),
        ChangeNotifierProvider.value(value: postsProvider),
        ChangeNotifierProvider.value(value: GroupsProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CookingTheme.lightTheme,
        darkTheme: CookingTheme.darkTheme,
        themeMode: ThemeMode.system,
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: Utils.navigatorKey,
        title: "Cooking",
        initialRoute: "/",
        routes: {
          "/": (_) => MainPage(),
          SearchPage.routeName: (_) => const SearchPage(),
          Profile.routeName: (_) => Profile(),
          EditProfile.routeName: (_) => EditProfile(),
          GroupDetail.routeName: (_) => GroupDetail(),
          AddMembers.routeName: (_) => AddMembers(),
          GroupSettings.routeName: (_) => GroupSettings(),
          ForgotPassword.routeName: (_) => ForgotPassword(),
          Settings.routeName: (_) => Settings(),
        },
        onUnknownRoute: (_) =>
            MaterialPageRoute(builder: (_) => const NotFound()),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Loader()
              : snapshot.hasError
                  ? const Center(child: Text("Oops Something went wrong"))
                  : snapshot.hasData
                      ? VerifyEmail()
                      : const AuthPage();
        },
      ),
    );
  }
}
