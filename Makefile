FVM := $(shell which fvm)
FLUTTER := $(FVM) flutter

.PHONY: build
build:
	${FLUTTER} pub get
	${FLUTTER} pub run build_runner build --delete-conflicting-outputs

.PHONY: build-splash
build-splash:
	fvm flutter pub run flutter_native_splash:create

.PHONY: build-launcher
build-launcher:
	fvm flutter pub run flutter_launcher_icons