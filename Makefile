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
	flutter run --profile --flavor dev -t lib/main_dev.dart
run-stage-profile:
	flutter run --profile --flavor stage -t lib/main_stage.dart
run-prod-profile:
	flutter run --profile --flavor prod -t lib/main_prod.dart

# Release Builds
run-dev-release:
	flutter run --release  --flavor dev -t lib/main_dev.dart
run-stage-release:
	flutter run --release --flavor stage -t lib/main_stage.dart
run-prod-release:
	flutter run --release --flavor prod -t lib/main_prod.dart

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

# Export Archives .ipa, .aab and .apk
#
# .ipa Builds
build-ios:
	@echo "Build ${ENV}.ipa"
	make clean
	flutter build ipa --flavor ${ENV} -t lib/main_${ENV}.dart --obfuscate --split-debug-info=./build-output/debug/ --tree-shake-icons --export-options-plist=ios/ios-export-options.plist --suppress-analytics
	cp build/ios/ipa/app.ipa build-output/app.ipa
build-ios-dev:
	@make ENV=dev build-ios
build-ios-stage:
	@make ENV=stage build-ios
build-ios-prod:
	@make ENV=prod build-ios
# Analyse Builds
build-ios-analyze:
	@echo "Build iOS analyze"
	flutter build ipa --analyze-size --suppress-analytics

# Android Build
#
# .aab builds
build-android:
	@echo "Build ${ENV}.aab"
	make clean
	flutter build appbundle --flavor ${ENV} -t lib/main_${ENV}.dart --obfuscate --split-debug-info=./build-output/debug/
	cp build/app/outputs/bundle/${ENV}Release/app-${ENV}-release.aab build-output/
	mv build-output/app-${ENV}-release.aab build-output/app.aab
build-android-dev:
	@make ENV=dev build-android
build-android-stage:
	@make ENV=stage build-android
build-android-prod:
	@make ENV=prod build-android
# .apk builds
build-android-apk:
	@echo "Build self-distribution ${ENV}.apk"
	make clean
	flutter build apk --flavor ${ENV} -t lib/main_${ENV}.dart --obfuscate --split-debug-info=./build-output/debug/
	cp build/app/outputs/flutter-apk/app-${ENV}-release.apk build-output/
	mv build-output/app-${ENV}-release.apk build-output/app.apk
build-android-apk-dev:
	@make ENV=dev build-android-apk
build-android-apk-stage:
	@make ENV=stage build-android-apk
build-android-apk-prod:
	@make ENV=prod build-android-apk
# Analyse Build
build-android-analyze:
	@echo "Build Android analyze"
	flutter build appbundle --analyze-size --suppress-analytics

# Release Archive to AppStore/PlayStore
release-ios:
	@echo "Release iOS"
	cd ios; bundle exec fastlane deploy
release-android:
	@echo "Release Android"
	cd android; bundle exec fastlane deploy
release:
	@make build-ios-prod && @make release-ios && @make build-android-appbundle-prod && @make release-android

# Additional helpers
packages-outdated:
	flutter pub outdated
packages-upgrade:
	flutter pub upgrade
l10n:
	flutter gen-l10n
splashscreen:
	flutter pub run flutter_native_splash:create
appicons:
	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
flavorizr:
	flutter pub run flutter_flavorizr
deeplink:
	@printf "Android:\nadb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d 'counter:///counters/2'"
	@printf "\n\n"
	@printf "iOS:\nxcrun simctl openurl booted counter:///counters/2"
