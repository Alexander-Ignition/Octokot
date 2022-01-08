XCODEBUILD_TEST = xcodebuild clean test -scheme Octokot

test-macos:
	$(XCODEBUILD_TEST) -destination 'platform=macOS'

test-ios:
	$(XCODEBUILD_TEST) -destination 'platform=iOS Simulator,name=iPhone 13'

test-tvos:
	$(XCODEBUILD_TEST) -destination 'platform=tvOS Simulator,OS=15.2,name=Apple TV'

test-watchos:
	$(XCODEBUILD_TEST) -destination 'platform=watchOS Simulator,name=Apple Watch Series 7 - 45mm'