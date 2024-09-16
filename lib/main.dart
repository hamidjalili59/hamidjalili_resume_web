import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hamidjalili_resume_web/src/config/config.dart';
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
              itemCount: 2,
              itemBuilder: (context, index) =>
                  const [CartamWidget(), TouriperWidget()][index],
            ),
          ),
        ),
      ),
    );
  }
}

class TouriperWidget extends StatelessWidget {
  const TouriperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ColoredBox(
            color: const Color(0xff000090),
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'نرم افزار توریپر',
                    style: kHeading5BoldTextStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13ProMax,
                      isFrameVisible: true,
                      orientation: Orientation.portrait,
                      screen: const DeviceWidget(
                        link: 'https://touriper.liara.run/',
                      ),
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
                      child: Image.asset('assets/pngs/touriper.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Touriper\nیک نرم‌افزار جامع و قدرتمند برای مدیریت هتل‌ها و آژانس‌های مسافرتی است که تمامی نیازهای شما را برای مدیریت رزرو، حسابداری و امور مالی در یک پلتفرم یکپارچه فراهم می‌کند. با **Touriper**، می‌توانید به سادگی اتاق‌ها را مدیریت کرده، رزروها را پیگیری کنید و به راحتی وضعیت پرداخت‌ها و فاکتورها را در کنترل خود داشته باشید. این نرم‌افزار به هتل‌ها و آژانس‌های مسافرتی کمک می‌کند تا فرآیندهای کاری‌شان را بهینه کرده و تجربه‌ای بی‌نقص برای مهمانان و مشتریان خود رقم بزنند.\nTouriper، راهکاری هوشمند برای مدیریت آسان و کارآمد هتل‌ها و آژانس‌های مسافرتی!',
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

class CartamWidget extends StatelessWidget {
  const CartamWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ColoredBox(
            color: Colors.blue,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'نرم افزار کارتام',
                    style: kHeading5BoldTextStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13ProMax,
                      isFrameVisible: true,
                      orientation: Orientation.portrait,
                      screen: const DeviceWidget(
                        link:
                            'https://hamidjalili59.github.io/cartam_web_view/',
                      ),
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
                      child: Image.asset('assets/pngs/cartam.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'کارتام\nنرم‌افزاری هوشمند برای ذخیره و مدیریت شماره‌های کارت‌های بانکی شماست که زندگی مالی‌تان را ساده‌تر می‌کند. با کارتام، می‌توانید به سرعت و با امنیت بالا، کارت‌های بانکی خود را ذخیره و در هر زمان نیاز داشتید با دوستان و خانواده به اشتراک بگذارید. دیگر نیازی به حفظ یا جستجوی شماره کارت‌ها در پیام‌ها و یادداشت‌ها نیست. همه‌چیز در یک مکان و همیشه در دسترس شماست.\nکارتام، مدیریت کارت‌های بانکی را آسان، سریع و بدون دردسر می‌کند!',
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
