get:
		@melos bootstrap
		@echo "Getting the dependencies"
clean: 
		@echo "Cleaning flutter project..."
		@melos clean
		@cd packages/rust_ffi_lib/rust && cargo clean
		@cd packages/clipboard_listener/rust && cargo clean
