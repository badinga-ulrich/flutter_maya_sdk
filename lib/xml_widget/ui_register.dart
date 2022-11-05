import 'register.dart';

import 'enums/ButtonTextTheme.dart' as _EnumButtonTextTheme;
import 'enums/Brightness.dart' as _EnumBrightness;
import 'enums/Clip.dart' as _EnumClip;
import 'enums/MaterialTapTargetSize.dart' as _EnumMaterialTapTargetSize;
import 'enums/MainAxisAlignment.dart' as _EnumMainAxisAlignment;
import 'enums/MainAxisSize.dart' as _EnumMainAxisSize;
import 'enums/CrossAxisAlignment.dart' as _EnumCrossAxisAlignment;
import 'enums/VerticalDirection.dart' as _EnumVerticalDirection;
import 'enums/DragStartBehavior.dart' as _EnumDragStartBehavior;
import 'enums/TextDirection.dart' as _EnumTextDirection;
import 'enums/TextBaseline.dart' as _EnumTextBaseline;
import 'enums/FontStyle.dart' as _EnumFontStyle;
import 'enums/TextLeadingDistribution.dart' as _EnumTextLeadingDistribution;
import 'enums/TextDecorationStyle.dart' as _EnumTextDecorationStyle;
import 'enums/TextAlign.dart' as _EnumTextAlign;
import 'enums/TextOverflow.dart' as _EnumTextOverflow;
import 'enums/TextWidthBasis.dart' as _EnumTextWidthBasis;
import 'enums/Axis.dart' as _EnumAxis;
import 'enums/ScrollViewKeyboardDismissBehavior.dart' as _EnumScrollViewKeyboardDismissBehavior;
import 'enums/BlendMode.dart' as _EnumBlendMode;
import 'enums/BoxFit.dart' as _EnumBoxFit;
import 'enums/ImageRepeat.dart' as _EnumImageRepeat;
import 'enums/FilterQuality.dart' as _EnumFilterQuality;

import 'inlines/MouseCursor.dart' as _InlineMouseCursor;
import 'inlines/EdgeInsetsGeometry.dart' as _InlineEdgeInsetsGeometry;
import 'inlines/VisualDensity.dart' as _InlineVisualDensity;
import 'inlines/Duration.dart' as _InlineDuration;
import 'inlines/FloatingActionButtonLocation.dart' as _InlineFloatingActionButtonLocation;
import 'inlines/FloatingActionButtonAnimator.dart' as _InlineFloatingActionButtonAnimator;
import 'inlines/FontWeight.dart' as _InlineFontWeight;
import 'inlines/Locale.dart' as _InlineLocale;
import 'inlines/TextDecoration.dart' as _InlineTextDecoration;
import 'inlines/StrutStyle.dart' as _InlineStrutStyle;
import 'inlines/BoxConstraints.dart' as _InlineBoxConstraints;
import 'inlines/Matrix4.dart' as _InlineMatrix4;
import 'inlines/IconThemeData.dart' as _InlineIconThemeData;
import 'inlines/SystemUiOverlayStyle.dart' as _InlineSystemUiOverlayStyle;
import 'inlines/Rect.dart' as _InlineRect;
import 'inlines/Offset.dart' as _InlineOffset;

import 'widgets/MaterialButton.dart' as _WidgetMaterialButton;
import 'widgets/VisualDensity.dart' as _WidgetVisualDensity;
import 'widgets/FocusNode.dart' as _WidgetFocusNode;
import 'widgets/Duration.dart' as _WidgetDuration;
import 'widgets/Column.dart' as _WidgetColumn;
import 'widgets/Scaffold.dart' as _WidgetScaffold;
import 'widgets/Text.dart' as _WidgetText;
import 'widgets/TextRich.dart' as _WidgetTextRich;
import 'widgets/TextStyle.dart' as _WidgetTextStyle;
import 'widgets/LocaleFromSubtags.dart' as _WidgetLocaleFromSubtags;
import 'widgets/TextDecorationCombine.dart' as _WidgetTextDecorationCombine;
import 'widgets/StrutStyle.dart' as _WidgetStrutStyle;
import 'widgets/StrutStyleFromTextStyle.dart' as _WidgetStrutStyleFromTextStyle;
import 'widgets/TextHeightBehavior.dart' as _WidgetTextHeightBehavior;
import 'widgets/Icon.dart' as _WidgetIcon;
import 'widgets/GridView.dart' as _WidgetGridView;
import 'widgets/GridViewBuilder.dart' as _WidgetGridViewBuilder;
import 'widgets/GridViewCustom.dart' as _WidgetGridViewCustom;
import 'widgets/GridViewCount.dart' as _WidgetGridViewCount;
import 'widgets/GridViewExtent.dart' as _WidgetGridViewExtent;
import 'widgets/ScrollController.dart' as _WidgetScrollController;
import 'widgets/ScrollPhysics.dart' as _WidgetScrollPhysics;
import 'widgets/SizedBox.dart' as _WidgetSizedBox;
import 'widgets/Container.dart' as _WidgetContainer;
import 'widgets/BoxConstraints.dart' as _WidgetBoxConstraints;
import 'widgets/BoxConstraintsTightFor.dart' as _WidgetBoxConstraintsTightFor;
import 'widgets/BoxConstraintsTightForFinite.dart' as _WidgetBoxConstraintsTightForFinite;
import 'widgets/BoxConstraintsExpand.dart' as _WidgetBoxConstraintsExpand;
import 'widgets/Matrix4FromList.dart' as _WidgetMatrix4FromList;
import 'widgets/Matrix4FromBuffer.dart' as _WidgetMatrix4FromBuffer;
import 'widgets/AppBar.dart' as _WidgetAppBar;
import 'widgets/IconThemeData.dart' as _WidgetIconThemeData;
import 'widgets/TextTheme.dart' as _WidgetTextTheme;
import 'widgets/SystemUiOverlayStyle.dart' as _WidgetSystemUiOverlayStyle;
import 'widgets/Image.dart' as _WidgetImage;
import 'widgets/ImageNetwork.dart' as _WidgetImageNetwork;
import 'widgets/ImageFile.dart' as _WidgetImageFile;
import 'widgets/ImageAsset.dart' as _WidgetImageAsset;
import 'widgets/ImageMemory.dart' as _WidgetImageMemory;
import 'widgets/RectFromCircle.dart' as _WidgetRectFromCircle;
import 'widgets/RectFromCenter.dart' as _WidgetRectFromCenter;
import 'widgets/ListView.dart' as _WidgetListView;
import 'widgets/ListViewBuilder.dart' as _WidgetListViewBuilder;
import 'widgets/ListViewSeparated.dart' as _WidgetListViewSeparated;
import 'widgets/ListViewCustom.dart' as _WidgetListViewCustom;
import 'widgets/Divider.dart' as _WidgetDivider;
import 'widgets/ListTile.dart' as _WidgetListTile;


Register register = Register(() {
  // Register all enums
  _EnumButtonTextTheme.register();
  _EnumBrightness.register();
  _EnumClip.register();
  _EnumMaterialTapTargetSize.register();
  _EnumMainAxisAlignment.register();
  _EnumMainAxisSize.register();
  _EnumCrossAxisAlignment.register();
  _EnumVerticalDirection.register();
  _EnumDragStartBehavior.register();
  _EnumTextDirection.register();
  _EnumTextBaseline.register();
  _EnumFontStyle.register();
  _EnumTextLeadingDistribution.register();
  _EnumTextDecorationStyle.register();
  _EnumTextAlign.register();
  _EnumTextOverflow.register();
  _EnumTextWidthBasis.register();
  _EnumAxis.register();
  _EnumScrollViewKeyboardDismissBehavior.register();
  _EnumBlendMode.register();
  _EnumBoxFit.register();
  _EnumImageRepeat.register();
  _EnumFilterQuality.register();
  
  // Register all inlines
  _InlineMouseCursor.register();
  _InlineEdgeInsetsGeometry.register();
  _InlineVisualDensity.register();
  _InlineDuration.register();
  _InlineFloatingActionButtonLocation.register();
  _InlineFloatingActionButtonAnimator.register();
  _InlineFontWeight.register();
  _InlineLocale.register();
  _InlineTextDecoration.register();
  _InlineStrutStyle.register();
  _InlineBoxConstraints.register();
  _InlineMatrix4.register();
  _InlineIconThemeData.register();
  _InlineSystemUiOverlayStyle.register();
  _InlineRect.register();
  _InlineOffset.register();
  
  // Register all widgets
  _WidgetMaterialButton.register();// <MaterialButton>
  _WidgetVisualDensity.register();// <VisualDensity>
  _WidgetFocusNode.register();// <FocusNode>
  _WidgetDuration.register();// <Duration>
  _WidgetColumn.register();// <Column>
  _WidgetScaffold.register();// <Scaffold>
  _WidgetText.register();// <Text>
  _WidgetTextRich.register();// <TextRich>
  _WidgetTextStyle.register();// <TextStyle>
  _WidgetLocaleFromSubtags.register();// <LocaleFromSubtags>
  _WidgetTextDecorationCombine.register();// <TextDecorationCombine>
  _WidgetStrutStyle.register();// <StrutStyle>
  _WidgetStrutStyleFromTextStyle.register();// <StrutStyleFromTextStyle>
  _WidgetTextHeightBehavior.register();// <TextHeightBehavior>
  _WidgetIcon.register();// <Icon>
  _WidgetGridView.register();// <GridView>
  _WidgetGridViewBuilder.register();// <GridViewBuilder>
  _WidgetGridViewCustom.register();// <GridViewCustom>
  _WidgetGridViewCount.register();// <GridViewCount>
  _WidgetGridViewExtent.register();// <GridViewExtent>
  _WidgetScrollController.register();// <ScrollController>
  _WidgetScrollPhysics.register();// <ScrollPhysics>
  _WidgetSizedBox.register();// <SizedBox>
  _WidgetContainer.register();// <Container>
  _WidgetBoxConstraints.register();// <BoxConstraints>
  _WidgetBoxConstraintsTightFor.register();// <BoxConstraintsTightFor>
  _WidgetBoxConstraintsTightForFinite.register();// <BoxConstraintsTightForFinite>
  _WidgetBoxConstraintsExpand.register();// <BoxConstraintsExpand>
  _WidgetMatrix4FromList.register();// <Matrix4FromList>
  _WidgetMatrix4FromBuffer.register();// <Matrix4FromBuffer>
  _WidgetAppBar.register();// <AppBar>
  _WidgetIconThemeData.register();// <IconThemeData>
  _WidgetTextTheme.register();// <TextTheme>
  _WidgetSystemUiOverlayStyle.register();// <SystemUiOverlayStyle>
  _WidgetImage.register();// <Image>
  _WidgetImageNetwork.register();// <ImageNetwork>
  _WidgetImageFile.register();// <ImageFile>
  _WidgetImageAsset.register();// <ImageAsset>
  _WidgetImageMemory.register();// <ImageMemory>
  _WidgetRectFromCircle.register();// <RectFromCircle>
  _WidgetRectFromCenter.register();// <RectFromCenter>
  _WidgetListView.register();// <ListView>
  _WidgetListViewBuilder.register();// <ListViewBuilder>
  _WidgetListViewSeparated.register();// <ListViewSeparated>
  _WidgetListViewCustom.register();// <ListViewCustom>
  _WidgetDivider.register();// <Divider>
  _WidgetListTile.register();// <ListTile>
  
});
