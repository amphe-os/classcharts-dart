<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

ClassDarts is a simple and easy package for interfacing with the classcharts school learning platform by Tes

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

This example uses classdarts to authenticate and get basic infomation about the user

```dart
void main() async {
  var user = UserAuthentication();
  var session = await user.login(AN3KHGI7JG, "1/1/1984");
  print(session);
  var student = StudentClient(session);
  print(student.basicInfo());
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.

To contribute to this repository we recomend installing the [eduAmphe essentials pack](https://github.com/amphe-os/eduamphe-essentials) before doing so

Many thanks to the [unoffical classcharts api authors](https://github.com/classchartsapi/classcharts-api-js) for creating documentations to classcharts.

Huge thanks to [classcharts.py authors](https://github.com/NCPlayz/classcharts.py) for using a diffrent implementation of logins that acc worked on dio.
