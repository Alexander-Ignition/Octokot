XCODEBUILD_TEST = xcodebuild clean test -scheme Octokot -destination

test-macos:
	$(XCODEBUILD_TEST) 'platform=macOS'

test-ios:
	$(XCODEBUILD_TEST) 'platform=iOS Simulator,name=iPhone 13'

test-tvos:
	$(XCODEBUILD_TEST) 'platform=tvOS Simulator,name=Apple TV'

test-watchos:
	$(XCODEBUILD_TEST) 'platform=watchOS Simulator,name=Apple Watch Series 7 - 45mm'

test: test-macos test-ios test-tvos test-watchos
