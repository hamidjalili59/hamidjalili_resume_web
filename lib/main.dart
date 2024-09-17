import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hamidjalili_resume_web/src/config/config.dart';
import 'package:hamidjalili_resume_web/src/core/constants/general_constants.dart';
import 'package:hamidjalili_resume_web/src/core/scroll_behavior.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {
  WebViewPlatform.instance = WebWebViewPlatform();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: MaterialApp(
        home: Scaffold(
          body: SizedBox.expand(
            child: PageView.builder(
              scrollBehavior: AppScrollBehavior(),
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) => ApplicationViewWidget(
                link: [
                  touriperLink,
                  cartamLink,
                  quranLink,
                  lingojooLink,
                ][index],
                iconLink: [
                  'assets/pngs/touriper.png',
                  'assets/pngs/cartam.png',
                  'assets/pngs/quran.webp',
                  'assets/pngs/lingojoo.png',
                ][index],
                description: [
                  touriperDesc,
                  cartamDesc,
                  quranDesc,
                  lingojooDesc,
                ][index],
                title: ['توریپر', 'کارتام', 'قرآن', 'لینگوجو'][index],
                primaryColor: [
                  touriperColor,
                  cartamColor,
                  quranColor,
                  lingojooColor,
                ][index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ApplicationViewWidget extends StatelessWidget {
  const ApplicationViewWidget({
    super.key,
    required this.title,
    required this.link,
    required this.iconLink,
    required this.primaryColor,
    required this.description,
  });
  final String title;
  final String iconLink;
  final String description;
  final String link;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ColoredBox(
            color: primaryColor,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kHeading5BoldTextStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13ProMax,
                      isFrameVisible: true,
                      orientation: Orientation.portrait,
                      screen: DeviceWidget(link: link),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().moveX(
                begin: -MediaQuery.of(context).size.width * .65,
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 1250),
              ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnconstrainedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: Image.asset(iconLink),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: kNormalTextStyle.copyWith(
                      color: Colors.black, height: 1.3),
                ),
              ],
            ),
          ),
        ).animate().fadeIn(
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 1250),
            delay: Durations.medium1),
      ],
    );
  }
}

class DeviceWidget extends StatefulWidget {
  const DeviceWidget({super.key, required this.link});
  final String link;

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  bool isLoading = true;
  late final PlatformWebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    );
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await _controller.loadRequest(
          LoadRequestParams(
            uri: Uri.parse(widget.link),
          ),
        );
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PlatformWebViewWidget(
              PlatformWebViewWidgetCreationParams(controller: _controller),
            ).build(context),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
