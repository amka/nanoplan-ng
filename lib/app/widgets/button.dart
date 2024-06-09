import 'package:flutter/material.dart';

enum ButtonVariant { primary, error, warning, info, accent, ghost, base }

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPressed,
    this.title,
    this.icon,
    this.variant = ButtonVariant.base,
    this.loading = false,
  });

  final Function()? onPressed;
  final String? title;
  final IconData? icon;
  final ButtonVariant variant;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading ? null : onPressed,
      shape: const StadiumBorder(),
      color: getBgColor(context, variant),
      textColor: getTextColor(context, variant),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: loading
          ? const CircularProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      icon!,
                      size: 16,
                      color: getTextColor(context, variant),
                    ),
                  ),
                if (title != null)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: getTextColor(context, variant),
                            ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  /// Returns the background color for a button based on the given context and variant.
  ///
  /// The [context] parameter is the BuildContext in which the button is being used.
  /// The [variant] parameter is the variant of the button.
  ///
  /// Returns a [Color] object representing the background color of the button.
  Color getBgColor(BuildContext context, ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primary:
        return Theme.of(context).colorScheme.primary;
      case ButtonVariant.error:
        return Theme.of(context).colorScheme.error;
      case ButtonVariant.warning:
        return Colors.yellow.shade700;
      case ButtonVariant.info:
        return Theme.of(context).colorScheme.tertiary;
      case ButtonVariant.accent:
        return Theme.of(context).colorScheme.secondary;
      case ButtonVariant.ghost:
      case ButtonVariant.base:
      default:
        return Theme.of(context).colorScheme.surfaceDim;
    }
  }

  /// Returns the text color for a button based on the given context and variant.
  ///
  /// The [context] parameter is the BuildContext in which the button is being used.
  /// The [variant] parameter is the variant of the button.
  ///
  /// Returns a [Color] object representing the text color of the button.
  Color getTextColor(BuildContext context, ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primary:
        return Theme.of(context).colorScheme.onPrimary;
      case ButtonVariant.error:
        return Theme.of(context).colorScheme.onError;
      case ButtonVariant.warning:
        return Colors.white;
      case ButtonVariant.info:
        return Theme.of(context).colorScheme.onTertiary;
      case ButtonVariant.accent:
        return Theme.of(context).colorScheme.onSecondary;
      case ButtonVariant.ghost:
      case ButtonVariant.base:
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }
}
