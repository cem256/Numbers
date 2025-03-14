part of '../pages/settings_page.dart';

class _ThemesBottomSheet extends StatelessWidget {
  const _ThemesBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.background,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: context.colorScheme.secondary),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: AppPadding.custom(
              horizontal: AppPadding.large,
              vertical: AppPadding.large,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: IconSize.medium),
                    Hero(
                      tag: '${_kHeroTagPrefix}0',
                      child: SvgPicture.asset(
                        Assets.images.theme,
                        color: context.theme.iconTheme.color,
                        height: IconSize.xLarge,
                      ),
                    ),
                    InkWell(
                      onTap: context.pop,
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      highlightColor: Colors.transparent,
                      child: SvgPicture.asset(
                        Assets.images.close,
                        color: context.theme.iconTheme.color,
                        width: IconSize.medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppPadding.medium),
                Text(
                  kThemeOptionsText,
                  style: context.textTheme.displayMedium,
                ),
                const SizedBox(height: AppPadding.xxLarge),
                const _ThemeSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          kThemeText,
          style: context.textTheme.titleMedium,
        ),
        SharpToggleSwitch(
          onToggle: (position) {
            if (position == SwitchPosition.left) {
              context.read<AppCubit>().updateTheme(AvailableTheme.light);
              return;
            }

            context.read<AppCubit>().updateTheme(AvailableTheme.dark);
          },
          initialPosition:
              context.read<AppCubit>().state.theme == AvailableTheme.light ? SwitchPosition.left : SwitchPosition.right,
          leftSwitch: kLightText,
          rightSwitch: kDarkText,
          primaryColor: context.theme.primaryColorLight,
          secondaryColor: context.colorScheme.background,
        ),
      ],
    );
  }
}
