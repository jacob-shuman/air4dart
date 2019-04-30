**This project was forked from [LucasCLuk](https://github.com/LucasCLuk)'s [sub4dart](https://github.com/LucasCLuk/sub4dart) repo**

A [Subsonic](http://www.subsonic.org/pages/index.jsp) API wrapper written in Dart.
This package is modified from LucasCLuk's sub4sonic to accomodate [Airsonic](https://airsonic.github.io)'s version of the Subsonic API.


Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:air4dart/air4dart.dart';

main() async {
  var airsonic = new AirSonic("https://music.example.com","John","Doe");
  await airsonic.getPing(); // Returns a response if successfully authenticated
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/LucasCLuk/sub4dart/issues
[subsonic]: http://www.subsonic.org/pages/index.jsp
