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
update-gold: 
	flutter test --update-goldens
integration-test:
	flutter test integration_test --flavor 'dev'
integration-test-desktop:
	flutter test integration_test


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

# Build Archives for iOS/Android and Web

#
# Build iOS .ipa
#
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
#
# Build Android .aab
#
build-android-aab:
	@echo "Build ${ENV}.aab"
	make clean
	flutter build appbundle --flavor ${ENV} -t lib/main_${ENV}.dart --obfuscate --split-debug-info=./build-output/debug/
	cp build/app/outputs/bundle/${ENV}Release/app-${ENV}-release.aab build-output/
build-android-aab-dev:
	@make ENV=dev build-android-aab
build-android-aab-stage:
	@make ENV=stage build-android-aab
build-android-aab-prod:
	@make ENV=prod build-android-aab
#
# Build Android .apk
#
build-android-apk:
	@echo "Build self-distribution ${ENV}.apk"
	make clean
	flutter build apk --flavor ${ENV} -t lib/main_${ENV}.dart --obfuscate --split-debug-info=./build-output/debug/
	cp build/app/outputs/flutter-apk/app-${ENV}-release.apk build-output/
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
#
# Build Web
#
build-web:
	@echo "Build web for ${ENV}"
	make clean
	rm -rf build-output/web
	flutter build web
	cp -r build/web build-output/web
build-web-dev:
	@make ENV=dev build-web
build-web-stage:
	@make ENV=stage build-web
build-web-prod:
	@make ENV=prod build-web

# Release Archive to AppStore/PlayStore
release-ios:
	@echo "Release iOS"
	cd ios; bundle exec fastlane deploy
release-android:
	@echo "Release Android"
	cd android; bundle exec fastlane deploy
release:
	@make build-ios-prod && @make release-ios && @make build-android-aab-prod && @make release-android

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
