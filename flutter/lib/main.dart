import 'package:camera/camera.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/providers/rewards.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/edit_profile.dart';
import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:cooking/views/reward_detail/reward_detail.dart';
import 'package:cooking/views/home/home_view.dart';
import 'package:cooking/views/not_found/not_found.dart';
import 'package:cooking/views/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  print(cameras.length);
  runApp(Cooking(camera: cameras.first,));
}

class Cooking extends StatefulWidget {
  final CameraDescription camera;

  Cooking({required this.camera});

  @override
  _CookingState createState() => _CookingState();
}

class _CookingState extends State<Cooking> {
  final RewardsProvider rewardsProvider = RewardsProvider();
  final PostsProvider postsProvider = PostsProvider();
  final UsersProvider usersProvider = UsersProvider();

  @override
  void initState() {
    rewardsProvider.fetchRewards();
    postsProvider.fetchPosts();
    usersProvider.getNationalRanking();
    usersProvider.getConnectedUser("60e8c2140e7c9296fa2380c3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData cookingTheme = ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      highlightColor: Color.fromRGBO(232, 196, 81, 1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(232, 196, 81, 1)),
        ),
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: rewardsProvider),
        ChangeNotifierProvider.value(value: postsProvider),
        ChangeNotifierProvider.value(value: usersProvider)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "homepage",
        initialRoute: "/",
        routes: {
          "/": (_) => HomeView(camera: widget.camera,),
          RewardDetail.routeName: (_) => RewardDetail(),
          SearchPage.routeName: (_) => const SearchPage(),
          Profile.routeName: (_) => Profile(),
          EditProfile.routeName: (_) => EditProfile(),
        },
        onUnknownRoute: (_) =>
            MaterialPageRoute(builder: (_) => const NotFound()),
        theme: cookingTheme,
      ),
    );
  }
}
