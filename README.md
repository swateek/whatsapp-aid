# WhatsApp Aid

Did you ever find it annoying to have to add a contact to be able to send a WhatsApp message? Be it for a delivery person or even a house help?

This is perhaps for you! You just need to specify the number in the text box and click on the button to open your WhatsApp without having to add the person to contact.

## Development

This project is intentionally still on its original Flutter/Dart dependency set. SDK and package upgrades are planned separately from the repository hygiene work.

Run the basic local checks before opening a pull request:

```sh
cd app
flutter pub get
flutter analyze
flutter test
```

Build Android APKs locally with:

```sh
cd app
flutter build apk --release --split-per-abi
```

## Distribution Builds

Android distribution APKs are built by GitHub Actions instead of being committed to the repository.

- Pull requests and branch pushes run validation only.
- Tag pushes matching `v*` build APK artifacts automatically.
- Non-tag APK builds can be started manually from the `Android` workflow in GitHub Actions.

## Feature Demo

<!-- [<img src="https://i.imgur.com/jPxrrCJ.gif" width="100%">](https://youtu.be/eXyAxHVpm-8) -->
[<img src="https://i.imgur.com/06sBLYt.png" width="100%">](https://youtu.be/eXyAxHVpm-8)

## Note

This app is not yet available on the Google Play Store. If you choose to use it, download the APK artifact from a tagged or manually run GitHub Actions workflow.
