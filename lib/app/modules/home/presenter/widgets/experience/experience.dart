import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/presenter/widgets/app_text/app_rich_text.dart';
import '../../../../../core/presenter/widgets/app_text/app_text.dart';
import '../../../../../core/presenter/widgets/timeline/horizontal_timeline.dart';
import '../../../../../core/utils/definitions/spacing.dart';
import '../../../../../core/utils/definitions/typography.dart';
import '../../controllers/home_controller.dart';
import '../curriculum_button/curriculum_button.dart';

class Experience extends StatelessWidget {
  const Experience(
      {super.key, required this.isMobile, required this.homeController});
  final bool isMobile;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          HorizontalTimeline(
            scrollController: homeController.experienceScrollController,
            currentIndex: homeController.currentExperienceIndex,
            events: homeController.experienceTimeline
                .map((e) => e.timelineTitle)
                .toList(),
          ),
          AppSizedBox.m,
          CarouselSlider(
            carouselController: homeController.experienceCarouselController,
            items: homeController.experienceTimeline.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: isMobile
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: isMobile ? 40 : 60,
                              backgroundImage:
                                  NetworkImage(item.companyImageUrl)),
                          isMobile ? AppSizedBox.m : AppSizedBox.l,
                          AppRichText(
                            style: AppTypography.text,
                            children: [
                              AppText.sectionHeader1(
                                item.title,
                                textStyle: isMobile
                                    ? AppTypography.sectionHeader2
                                    : AppTypography.sectionHeader1,
                              ),
                              const AppText.text('\n'),
                              AppText.reference(
                                item.time,
                                textStyle: isMobile
                                    ? AppTypography.reference
                                    : AppTypography.reference2,
                              ),
                              AppText.text(isMobile ? '\n' : '\n\n'),
                              AppText.text(
                                isMobile ? item.companyMobile : item.company,
                                textStyle: isMobile
                                    ? AppTypography.text
                                    : AppTypography.text2,
                              ),
                              const AppText.text('\n'),
                              AppText.reference(
                                item.location,
                                textStyle: isMobile
                                    ? AppTypography.reference
                                    : AppTypography.reference2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      isMobile ? AppSizedBox.m : AppSizedBox.xl,
                      AppText.text(
                        item.description,
                        textStyle:
                            isMobile ? AppTypography.text2 : AppTypography.text,
                      ),
                      isMobile ? AppSizedBox.m : AppSizedBox.xl,
                      AppRichText(
                          style: isMobile
                              ? AppTypography.text2
                                  .copyWith(color: Colors.white)
                              : AppTypography.text
                                  .copyWith(color: Colors.white),
                          children: [
                            const AppText.text('Skills:  '),
                            AppText.text(
                              item.skills,
                              textStyle: isMobile
                                  ? AppTypography.text2.copyWith(
                                      color: Colors.white.withOpacity(0.4))
                                  : AppTypography.text.copyWith(
                                      color: Colors.white.withOpacity(0.4)),
                            ),
                          ]),
                    ],
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: isMobile ? 350 : 400,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (int pageIndex, _) {
                  homeController.setCurrentExperienceIndex(pageIndex);
                },
                initialPage: homeController.currentExperienceIndex),
          ),
          isMobile ? const SizedBox.shrink() : AppSizedBox.xxl,
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurriculumButton(isMobile: isMobile),
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      );
    });
  }
}
