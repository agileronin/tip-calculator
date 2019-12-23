import 'package:flutter/widgets.dart';

class WidgetScaler {
  final MediaQueryData mediaQueryData;

  WidgetScaler({@required this.mediaQueryData});

  double get screenWidth {
    return mediaQueryData.size.width;
  }

  double get screenHeight {
    return mediaQueryData.size.height;
  }

  double get blockSizeHorizontal {
    return screenWidth / 100.0;
  }

  double get blockSizeVertical {
    return screenHeight / 100.0;
  }

  double get safeAreaHorizontal {
    return mediaQueryData.padding.left + mediaQueryData.padding.right;
  }

  double get safeAreaVertical {
    return mediaQueryData.padding.top + mediaQueryData.padding.bottom;
  }

  double get safeBlockHorizontal {
    return (screenWidth - safeAreaHorizontal) / 100.0;
  }

  double get safeBlockVertical {
    return (screenHeight - safeAreaVertical) / 100.0;
  }
}
