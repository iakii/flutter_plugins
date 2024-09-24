get:
		@melos bootstrap
		@echo "Getting the dependencies"
clean: 
		@echo "Cleaning flutter project..."
		@melos clean
		@cd packages/flutter_rust_lib_core/rust && cargo clean
		@cd packages/system_tray/rust && cargo clean
		@cd packages/system_hotkey/rust && cargo clean
format:
		@melos format
		@echo "Start format code"