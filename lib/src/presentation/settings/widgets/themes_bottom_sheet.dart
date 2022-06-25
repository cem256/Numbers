import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharp_toggle_switch/sharp_toggle_switch.dart';

import '../../../core/core.dart';

class ThemesBottomSheet extends StatelessWidget {
  const ThemesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).backgroundColor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalSpace,
                vertical: kLongVerticalSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: kIconSize),
                      Hero(
                        tag: 'option0',
                        child: SvgPicture.asset(
                          kThemeIconPath,
                          color: Theme.of(context).iconTheme.color,
                          height: MediaQuery.of(context).size.height * 0.10,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        highlightColor: Colors.transparent,
                        child: SvgPicture.asset(
                          kCloseIconPath,
                          color: Theme.of(context).iconTheme.color,
                          width: kIconSize,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kVerticalSpace),
                  Text(
                    kThemeOptionsText,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: kVeryLongVerticalSpace),
                  _buildThemeSelectionRow(context),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildThemeSelectionRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            kThemeText,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SharpToggleSwitch(
            onToggle: (position) {},
            leftSwitch: kLightText,
            rightSwitch: kDarkText,
            primaryColor: Theme.of(context).primaryColor,
            secondaryColor: Theme.of(context).primaryColorLight,
          ),
        ],
      );
}
