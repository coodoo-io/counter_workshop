run:
	flutter run
run-prod:
	flutter run --release

clean:
	flutter clean
	flutter pub get
	make build-runner
	make format

format:
	dart format . --line-length 120

lint:
	dart analyze

test:
	flutter test
.PHONY:test

build-runner:
	dart run build_runner build --delete-conflicting-outputs

build-runner-watch:
	dart run build_runner watch --delete-conflicting-outputs