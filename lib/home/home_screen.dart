import '../app_import.dart';
import '../const/app_import.dart';

class HomeScreePage extends StatefulWidget {
  final String? token;
  const HomeScreePage({super.key, this.token});

  @override
  State<HomeScreePage> createState() => _HomeScreePageState();
}

class _HomeScreePageState extends State<HomeScreePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageController>().fetchData(token: widget.token!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<HomePageController>(
      create: (context) => HomePageController(),
      child: Center(
        child: Text(context.watch<HomePageController>().fetchValue),
      ),
    ));
  }
}
