#
# Makefile for CI/CD Environments and commandline users
#

# Dev Builds
run-dev:
	flutter run --flavor dev -t lib/main_dev.dart
run-stage:
	flutter run --flavor stage -t lib/main_stage.dart
run-prod:
	flutter run --flavor prod -t lib/main_prod.dart

# Profile Builds
run-dev-profile:
	flutter run --profile
run-stage-profile:
	flutter run --profile
run-prod-profile:
	flutter run --profile

# Release Builds
run-dev-release:
	flutter run --release 
run-stage-release:
	flutter run --release
run-prod-release:
	flutter run --release

# Format & Lint
format:
	flutter format . --line-length 120 --set-exit-if-changed
format-fix:
	flutter format . --line-length 120
lint:
	flutter analyze

# Testing
test:
	flutter test
.PHONY: test

# Build runner
build-runner:
	flutter pub run build_runner build --delete-conflicting-outputs
build-runner-watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

# Clean project
clean:
	flutter clean
	flutter pub get
	make build-runner


# App-icon & Splashscreen
build-splashscreen:
	flutter pub run flutter_native_splash:create
build-appicons:
	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*

# Flavor
build-flavorizr:
	flutter pub run flutter_flavorizr

# Export Archives .ipa, .aab and .apk
build-ios:
	@echo "Build iOS"
	make clean
	flutter build ipa --obfuscate --split-debug-info=./build-output/debug/ --tree-shake-icons --export-options-plist=ios/ios-export-options.plist --suppress-analytics
	cp build/ios/ipa/app.ipa build-output/app.ipa
build-ios-analyze:
	@echo "Build iOS analyze"
	flutter build ipa --analyze-size --suppress-analytics
build-android:
	@echo "Build Store App Bundle"
	make clean
	flutter build appbundle --obfuscate --split-debug-info=./build-output/debug/
	cp build/app/outputs/bundle/release/app-release.aab build-output/
	mv build-output/app-release.aab build-output/app.aab
build-android-analyze:
	@echo "Build Android analyze"
	flutter build appbundle --analyze-size --suppress-analytics
build-android-apk:
	@echo "Build self-distribution .apk"
	make clean
	flutter build apk --obfuscate --split-debug-info=./build-output/debug/
	cp build/app/outputs/apk/release/app-release.apk build-output/
	mv build-output/app-release.apk build-output/app.apk

# Release Archive to AppStore/PlayStore
release-ios:
	@echo "Release iOS"
	cd ios; bundle exec fastlane deploy
release-android:
	@echo "Release Android"
	cd android; bundle exec fastlane deploy
release:
	@make build-ios && @make release-ios && @make build-android-appbundle && @make release-android

# Additional helpers
packages-outdated:
	flutter pub outdated
packages-upgrade:
	flutter pub upgrade
l10n:
	flutter gen-l10n
appicon:
	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml
deeplink:
	@printf "Android:\nadb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d 'https://counter.de/counters/2'"
	@printf "\n\n"
	@printf "iOS:\nxcrun simctl openurl booted counter:///counters/2"
