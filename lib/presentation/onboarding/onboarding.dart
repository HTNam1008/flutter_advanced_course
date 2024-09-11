import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/presentation/resources/assets_manager.dart';
import 'package:flutter_application_1/presentation/resources/color_manager.dart';
import 'package:flutter_application_1/presentation/resources/strings_manager.dart';
import 'package:flutter_application_1/presentation/resources/theme_manager.dart';
import 'package:flutter_application_1/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];

  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // appBar: AppBar(
      //   elevation: AppSize.s0,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: ColorManager.white,
      //     statusBarBrightness: Brightness.dark,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
          // return onBoardingPage
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow icon
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
                onTap: () {
                  _pageController.animateToPage(_getPreviousIndex(),
                      duration: const Duration(milliseconds: DurationConstant.d300),
                      curve: Curves.linear);
                }),
          ),

          // circles indicator
          Row(
            children: [
              for (int idx = 0; idx < _list.length; idx++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(idx),
                )
            ],
          ),

          // right arrow icon
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(_getNextIndex(),
                    duration: const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    return SizedBox(
      height: AppSize.s8, // Set the desired height for the circle
      width: AppSize.s8,  // Set the desired width for the circle
      child: SvgPicture.asset(
        index == _currentIndex ? ImageAssets.hollowCircleIc : ImageAssets.solidCircleIc,
      ),
    );
  }


  int _getPreviousIndex() {
    final previousIndex = _currentIndex - 1;
    if (previousIndex == -1){
      _currentIndex = _list.length - 1;
    }
    else {
      _currentIndex = _currentIndex - 1;
    }
    return _currentIndex;
  }

  int _getNextIndex() {
    final nextIndex = _currentIndex + 1;
    if (nextIndex >= _list.length){
      _currentIndex = 0;
    }
    else {
      _currentIndex = _currentIndex + 1;
    }
    return _currentIndex;
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,
          textAlign: TextAlign.center,
          // style: getApplicationTheme().textTheme.displayLarge,
          style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}


class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
