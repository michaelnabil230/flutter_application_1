.PHONY: help format build_apk build_abb clean build_ios

# Default target
help:
	@echo "Available targets:"
	@echo "  format                   Format and fix the code"
	@echo "  build_apk                Build split APK for Android"
	@echo "  build_abb                Build Android App Bundle using FVM"
	@echo "  build_ios                Build iOS IPA"
	@echo "  clean                    Clean the project"

build_runner_watch:
	@dart run build_runner watch --delete-conflicting-outputs

format:
	@dart format lib/
	@dart fix --apply

build_apk:
	make clean
	@flutter build apk --split-per-abi --target-platform android-arm64
	open build/app/outputs/flutter-apk

build_abb:
	make clean
	@flutter build appbundle
	open build/app/outputs/bundle/release

build_ios:
	make clean
	@flutter build ipa
	open build/ios/ipa

clean:
	clear
	@flutter clean
	@flutter pub get