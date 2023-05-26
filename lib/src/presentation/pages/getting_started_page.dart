import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/core/constants/storage_keys.dart';
import 'package:boxed/src/core/routes.dart';
import 'package:boxed/src/presentation/widgets/shared/boxed_empty_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  var assets = [
    'assets/lottie/app_delivery.json',
    'assets/lottie/object_delivered.json'
  ];
  var actualPage = 0;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      appBar: const BoxedEmptyAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView.builder(
                clipBehavior: Clip.none,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    actualPage = value % assets.length;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Lottie.asset(assets[index % assets.length]),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: assets.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: BoxedColors.black,
                dotColor: BoxedColors.grayLight,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            SizedBox(
              height: 216,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: actualPage == 0
                    ? Column(
                        key: ValueKey<int>(actualPage),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 10),
                            child: const Text(
                              'Seu app para monitorar entregas!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                color: BoxedColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 250,
                            child: Text(
                              'Acompanhamento dos principais meios de entrega do brasil em um só lugar.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    : actualPage == 1
                        ? Column(
                            key: ValueKey<int>(actualPage),
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 40, bottom: 10),
                                child: const Text(
                                  'Situação da entrega instantânea!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: BoxedColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 250,
                                child: Text(
                                  'Você saberá a hora exata em que a situação da sua remessa mudou.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            key: ValueKey<int>(actualPage),
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 40, bottom: 10),
                                child: const Text(
                                  'Seu app para monitorar entregas!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: BoxedColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 250,
                                child: Text(
                                  'Acompanhamento dos principais meios de entrega do brasil em um só lugar.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 40),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    top: -5,
                    left: -5,
                    right: 5,
                    bottom: 5,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        border: Border.all(color: BoxedColors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await const FlutterSecureStorage().write(
                          key: StorageKeys.isNotGettingStarted, value: 'true');

                      if (context.mounted) {
                        Navigator.of(context).pushNamed(Routes.home);
                      }
                    },
                    borderRadius: BorderRadius.circular(15),
                    splashColor: BoxedColors.grayLight,
                    child: Ink(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: BoxedColors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Começar agora',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
