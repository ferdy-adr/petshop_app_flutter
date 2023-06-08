part of 'pages.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> options = ['Activity', 'Seller Mode'];

  PageController notificationPageController = PageController();
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultMargin, 16, defaultMargin, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 46,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Notification',
                              style: blackTextFont.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 1.47,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: HeaderButton(
                              icon: IconlyLight.arrow_left_2,
                              onTap: () {
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    HeaderSwitchButton(
                      option1: options.first,
                      onTapOption1: () {
                        selectedOption = options.first;
                        setState(() {});
                      },
                      option2: options.last,
                      onTapOption2: () {
                        selectedOption = options.last;
                        setState(() {});
                      },
                      selectedOption: selectedOption ?? options.first,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
