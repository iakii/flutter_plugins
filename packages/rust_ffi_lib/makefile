gen:
		@echo "gen rust bridge code"
		@flutter_rust_bridge_codegen generate

clean: 
		@echo "Cleaning flutter project..."
		@flutter clean
		@echo "Cleaning rust project..."
		@cd rust&&cargo clean

format:
		@echo "Formatting the code"
		@dart format .

get: ## Get pub packages.
		@flutter pub get
		@cd rust_builder/cargokit/build_tool&&flutter pub get

android-env:
		@rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android i686-linux-android

macos-release:
		@flutter_distributor package --platform macos --targets dmg --skip-clean