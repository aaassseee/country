import 'package:flutter/material.dart';
import 'package:flutter_country_utility/flutter_country_utility.dart';

/// A builder to customize dropdown buttons.
///
/// Used by [CountryDropdownButton.itemBuilder] && [CountryDropdownButton.selectedItemBuilder].
typedef CountryDropdownButtonItemBuilder = Widget Function(
    BuildContext context, Country country);

/// Enum for pre-defined country dropdown layout types
enum CountryDropDownButtonType {
  name,
  callingCode,
  currency,
}

/// A Material Design button for selecting from a list of items.
///
/// A dropdown button lets the user select from a number of items. The button
/// shows the currently selected item as well as an arrow that opens a menu for
/// selecting another item.
///
/// ## Updating to [DropdownMenu]
///
/// There is a Material 3 version of this component,
/// [DropdownMenu] that is preferred for applications that are configured
/// for Material 3 (see [ThemeData.useMaterial3]).
/// The [DropdownMenu] widget's visuals
/// are a little bit different, see the Material 3 spec at
/// <https://m3.material.io/components/menus/guidelines> for
/// more details.
///
/// The [DropdownMenu] widget's API is also slightly different.
/// To update from [DropdownButton] to [DropdownMenu], you will
/// need to make the following changes:
///
/// 1. Instead of using [DropdownButton.items], which
/// takes a list of [DropdownMenuItem]s, use
/// [DropdownMenu.dropdownMenuEntries], which
/// takes a list of [DropdownMenuEntry]'s.
///
/// 2. Instead of using [DropdownButton.onChanged],
/// use [DropdownMenu.onSelected], which is also
/// a callback that is called when the user selects an entry.
///
/// 3. In [DropdownMenu] it is not required to track
/// the current selection in your app's state.
/// So, instead of tracking the current selection in
/// the [DropdownButton.value] property, you can set the
/// [DropdownMenu.initialSelection] property to the
/// item that should be selected before there is any user action.
///
/// 4. You may also need to make changes to the styling of the
/// [DropdownMenu], see the properties in the [DropdownMenu]
/// constructor for more details.
///
/// See the sample below for an example of migrating
/// from [DropdownButton] to [DropdownMenu].
///
/// ## Using [DropdownButton]
/// {@youtube 560 315 https://www.youtube.com/watch?v=ZzQ_PWrFihg}
///
/// One ancestor must be a [Material] widget and typically this is
/// provided by the app's [Scaffold].
///
/// The type `T` is the type of the [value] that each dropdown item represents.
/// All the entries in a given menu must represent values with consistent types.
/// Typically, an enum is used. Each [DropdownMenuItem] in [items] must be
/// specialized with that same type argument.
///
/// The [onChanged] callback should update a state variable that defines the
/// dropdown's value. It should also call [State.setState] to rebuild the
/// dropdown with the new value.
///
///
/// {@tool dartpad}
/// This sample shows a [DropdownButton] with a large arrow icon,
/// purple text style, and bold purple underline, whose value is one of "One",
/// "Two", "Free", or "Four".
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)
///
/// ** See code in examples/api/lib/material/dropdown/dropdown_button.0.dart **
/// {@end-tool}
///
/// If the [onChanged] callback is null or the list of [items] is null
/// then the dropdown button will be disabled, i.e. its arrow will be
/// displayed in grey and it will not respond to input. A disabled button
/// will display the [disabledHint] widget if it is non-null. However, if
/// [disabledHint] is null and [hint] is non-null, the [hint] widget will
/// instead be displayed.
///
/// {@tool dartpad}
/// This sample shows how you would rewrite the above [DropdownButton]
/// to use the [DropdownMenu].
///
/// ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.1.dart **
/// {@end-tool}
///
///
/// See also:
///
///  * [DropdownButtonFormField], which integrates with the [Form] widget.
///  * [DropdownMenuItem], the class used to represent the [items].
///  * [DropdownButtonHideUnderline], which prevents its descendant dropdown buttons
///    from displaying their underlines.
///  * [ElevatedButton], [TextButton], ordinary buttons that trigger a single action.
///  * <https://material.io/design/components/menus.html#dropdown-menu>
class CountryDropdownButton extends StatefulWidget {
  /// Creates a dropdown button.
  ///
  /// If [initialCountry] is null and the button is enabled, [hint] will be displayed
  /// if it is non-null.
  ///
  /// If [initialCountry] is null and the button is disabled, [disabledHint] will be displayed
  /// if it is non-null. If [disabledHint] is null, then [hint] will be displayed
  /// if it is non-null.
  ///
  /// The [dropdownColor] argument specifies the background color of the
  /// dropdown when it is open. If it is null, the current theme's
  /// [ThemeData.canvasColor] will be used instead.
  const CountryDropdownButton({
    super.key,
    this.selectableCountries = Countries.values,
    this.initialCountry,
    required this.itemBuilder,
    this.onChanged,
    this.hint,
    this.disabledHint,
    this.onTap,
    this.selectedItemBuilder,
    this.elevation = 8,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight = kMinInteractiveDimension,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.padding,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    this.borderRadius,
  });

  /// Creates a pre-defined layout dropdown button with [CountryDropDownButtonType].
  factory CountryDropdownButton.predefined({
    Key? key,
    bool showFlagEmoji = true,
    required CountryDropDownButtonType type,
    Iterable<Country> selectableCountries = Countries.values,
    Country? initialCountry,
    ValueChanged<Country?>? onChanged,
    Widget? hint,
    Widget? disabledHint,
    VoidCallback? onTap,
    CountryDropdownButtonItemBuilder? selectedItemBuilder,
    int elevation = 0,
    TextStyle? style,
    Widget? underline,
    Widget? icon,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double iconSize = 24,
    bool isDense = false,
    bool isExpanded = false,
    double itemHeight = kMinInteractiveDimension,
    Color? focusColor,
    FocusNode? focusNode,
    bool autofocus = false,
    Color? dropdownColor,
    EdgeInsetsGeometry? padding,
    double? menuMaxHeight,
    bool? enableFeedback,
    AlignmentGeometry alignment = AlignmentDirectional.centerStart,
    BorderRadius? borderRadius,
  }) =>
      CountryDropdownButton(
        key: key,
        selectableCountries: selectableCountries,
        initialCountry: initialCountry,
        itemBuilder: (context, country) => switch (type) {
          CountryDropDownButtonType.name => Text([
              if (showFlagEmoji) country.flagEmoji,
              country.isoLocalizedShortName(Localizations.localeOf(context)),
            ].join(' ')),
          CountryDropDownButtonType.callingCode => Text([
              if (showFlagEmoji) country.flagEmoji,
              country.countryCode,
            ].join(' ')),
          CountryDropDownButtonType.currency => Text([
              if (showFlagEmoji) country.flagEmoji,
              country.currencyCode,
            ].join(' ')),
        },
        onChanged: onChanged,
        hint: hint,
        disabledHint: disabledHint,
        onTap: onTap,
        selectedItemBuilder: selectedItemBuilder,
        elevation: elevation,
        style: style,
        underline: underline,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        padding: padding,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  /// The list of items the user can select.
  ///
  /// If the [onChanged] callback is null or the list of items is null
  /// then the dropdown button will be disabled, i.e. its arrow will be
  /// displayed in grey and it will not respond to input.
  final Iterable<Country> selectableCountries;

  /// The value of the initial selected [DropdownMenuItem].
  ///
  /// If [initialCountry] is null and the button is enabled, [hint] will be displayed
  /// if it is non-null.
  ///
  /// If [initialCountry] is null and the button is disabled, [disabledHint] will be displayed
  /// if it is non-null. If [disabledHint] is null, then [hint] will be displayed
  /// if it is non-null.
  final Country? initialCountry;

  /// The list of items the user can select.
  ///
  /// If the [onChanged] callback is null or the list of items is null
  /// then the dropdown button will be disabled, i.e. its arrow will be
  /// displayed in grey and it will not respond to input.
  final CountryDropdownButtonItemBuilder itemBuilder;

  /// {@template flutter.material.dropdownButton.onChanged}
  /// Called when the user selects an item.
  ///
  /// If the [onChanged] callback is null or the list of [DropdownButton.items]
  /// is null then the dropdown button will be disabled, i.e. its arrow will be
  /// displayed in grey and it will not respond to input. A disabled button
  /// will display the [DropdownButton.disabledHint] widget if it is non-null.
  /// If [DropdownButton.disabledHint] is also null but [DropdownButton.hint] is
  /// non-null, [DropdownButton.hint] will instead be displayed.
  /// {@endtemplate}
  final ValueChanged<Country?>? onChanged;

  /// A placeholder widget that is displayed by the dropdown button.
  ///
  /// If [value] is null and the dropdown is enabled ([items] and [onChanged] are non-null),
  /// this widget is displayed as a placeholder for the dropdown button's value.
  ///
  /// If [value] is null and the dropdown is disabled and [disabledHint] is null,
  /// this widget is used as the placeholder.
  final Widget? hint;

  /// A preferred placeholder widget that is displayed when the dropdown is disabled.
  ///
  /// If [value] is null, the dropdown is disabled ([items] or [onChanged] is null),
  /// this widget is displayed as a placeholder for the dropdown button's value.
  final Widget? disabledHint;

  /// Called when the dropdown button is tapped.
  ///
  /// This is distinct from [onChanged], which is called when the user
  /// selects an item from the dropdown.
  ///
  /// The callback will not be invoked if the dropdown button is disabled.
  final VoidCallback? onTap;

  /// A builder to customize the dropdown buttons corresponding to the
  /// [DropdownMenuItem]s in [items].
  ///
  /// When a [DropdownMenuItem] is selected, the widget that will be displayed
  /// from the list corresponds to the [DropdownMenuItem] of the same index
  /// in [items].
  ///
  /// {@tool dartpad}
  /// This sample shows a `DropdownButton` with a button with [Text] that
  /// corresponds to but is unique from [DropdownMenuItem].
  ///
  /// ** See code in examples/api/lib/material/dropdown/dropdown_button.selected_item_builder.0.dart **
  /// {@end-tool}
  ///
  /// If this callback is null, the [DropdownMenuItem] from [items]
  /// that matches [value] will be displayed.
  final CountryDropdownButtonItemBuilder? selectedItemBuilder;

  /// The z-coordinate at which to place the menu when open.
  ///
  /// The following elevations have defined shadows: 1, 2, 3, 4, 6, 8, 9, 12,
  /// 16, and 24. See [kElevationToShadow].
  ///
  /// Defaults to 8, the appropriate elevation for dropdown buttons.
  final int elevation;

  /// The text style to use for text in the dropdown button and the dropdown
  /// menu that appears when you tap the button.
  ///
  /// To use a separate text style for selected item when it's displayed within
  /// the dropdown button, consider using [selectedItemBuilder].
  ///
  /// {@tool dartpad}
  /// This sample shows a `DropdownButton` with a dropdown button text style
  /// that is different than its menu items.
  ///
  /// ** See code in examples/api/lib/material/dropdown/dropdown_button.style.0.dart **
  /// {@end-tool}
  ///
  /// Defaults to the [TextTheme.titleMedium] value of the current
  /// [ThemeData.textTheme] of the current [Theme].
  final TextStyle? style;

  /// The widget to use for drawing the drop-down button's underline.
  ///
  /// Defaults to a 0.0 width bottom border with color 0xFFBDBDBD.
  final Widget? underline;

  /// The widget to use for the drop-down button's icon.
  ///
  /// Defaults to an [Icon] with the [Icons.arrow_drop_down] glyph.
  final Widget? icon;

  /// The color of any [Icon] descendant of [icon] if this button is disabled,
  /// i.e. if [onChanged] is null.
  ///
  /// Defaults to [MaterialColor.shade400] of [Colors.grey] when the theme's
  /// [ThemeData.brightness] is [Brightness.light] and to
  /// [Colors.white10] when it is [Brightness.dark]
  final Color? iconDisabledColor;

  /// The color of any [Icon] descendant of [icon] if this button is enabled,
  /// i.e. if [onChanged] is defined.
  ///
  /// Defaults to [MaterialColor.shade700] of [Colors.grey] when the theme's
  /// [ThemeData.brightness] is [Brightness.light] and to
  /// [Colors.white70] when it is [Brightness.dark]
  final Color? iconEnabledColor;

  /// The size to use for the drop-down button's down arrow icon button.
  ///
  /// Defaults to 24.0.
  final double iconSize;

  /// Reduce the button's height.
  ///
  /// By default this button's height is the same as its menu items' heights.
  /// If isDense is true, the button's height is reduced by about half. This
  /// can be useful when the button is embedded in a container that adds
  /// its own decorations, like [InputDecorator].
  final bool isDense;

  /// Set the dropdown's inner contents to horizontally fill its parent.
  ///
  /// By default this button's inner width is the minimum size of its contents.
  /// If [isExpanded] is true, the inner width is expanded to fill its
  /// surrounding container.
  final bool isExpanded;

  /// If null, then the menu item heights will vary according to each menu item's
  /// intrinsic height.
  ///
  /// The default value is [kMinInteractiveDimension], which is also the minimum
  /// height for menu items.
  ///
  /// If this value is null and there isn't enough vertical room for the menu,
  /// then the menu's initial scroll offset may not align the selected item with
  /// the dropdown button. That's because, in this case, the initial scroll
  /// offset is computed as if all of the menu item heights were
  /// [kMinInteractiveDimension].
  final double? itemHeight;

  /// The color for the button's [Material] when it has the input focus.
  final Color? focusColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The background color of the dropdown.
  ///
  /// If it is not provided, the theme's [ThemeData.canvasColor] will be used
  /// instead.
  final Color? dropdownColor;

  /// Padding around the visible portion of the dropdown widget.
  ///
  /// As the padding increases, the size of the [DropdownButton] will also
  /// increase. The padding is included in the clickable area of the dropdown
  /// widget, so this can make the widget easier to click.
  ///
  /// Padding can be useful when used with a custom border. The clickable
  /// area will stay flush with the border, as opposed to an external [Padding]
  /// widget which will leave a non-clickable gap.
  final EdgeInsetsGeometry? padding;

  /// The maximum height of the menu.
  ///
  /// The maximum height of the menu must be at least one row shorter than
  /// the height of the app's view. This ensures that a tappable area
  /// outside of the simple menu is present so the user can dismiss the menu.
  ///
  /// If this property is set above the maximum allowable height threshold
  /// mentioned above, then the menu defaults to being padded at the top
  /// and bottom of the menu by at one menu item's height.
  final double? menuMaxHeight;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// By default, platform-specific feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// Defines how the hint or the selected item is positioned within the button.
  ///
  /// Defaults to [AlignmentDirectional.centerStart].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  /// Defines the corner radii of the menu's rounded rectangle shape.
  final BorderRadius? borderRadius;

  @override
  State<CountryDropdownButton> createState() => _CountryDropdownButtonState();
}

class _CountryDropdownButtonState extends State<CountryDropdownButton> {
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.initialCountry;
  }

  @override
  Widget build(BuildContext context) {
    final onChanged = widget.onChanged;
    final selectedItemBuilder = widget.selectedItemBuilder;

    return DropdownButton<Country>(
      items: [
        for (final country in widget.selectableCountries)
          DropdownMenuItem(
            value: country,
            child: widget.itemBuilder(context, country),
          ),
      ],
      value: selectedCountry,
      onChanged: (value) {
        setState(() {
          selectedCountry = value;
        });
        if (onChanged == null) return;
        onChanged(value);
      },
      selectedItemBuilder: selectedItemBuilder == null
          ? null
          : (context) => [
                for (final country in widget.selectableCountries)
                  selectedItemBuilder(context, country)
              ],
      hint: widget.hint,
      disabledHint: widget.disabledHint,
      onTap: widget.onTap,
      elevation: widget.elevation,
      style: widget.style,
      underline: widget.underline,
      icon: widget.icon,
      iconDisabledColor: widget.iconDisabledColor,
      iconEnabledColor: widget.iconEnabledColor,
      iconSize: widget.iconSize,
      isDense: widget.isDense,
      isExpanded: widget.isExpanded,
      itemHeight: widget.itemHeight,
      focusColor: widget.focusColor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      dropdownColor: widget.dropdownColor,
      menuMaxHeight: widget.menuMaxHeight,
      enableFeedback: widget.enableFeedback,
      alignment: widget.alignment,
      borderRadius: widget.borderRadius,
      padding: widget.padding,
    );
  }
}
