// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Octokot",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Octokot",
            targets: ["Octokot"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Octokot",
            dependencies: []),
        .testTarget(
            name: "OctokotTests",
            dependencies: ["Octokot"],
            resources: [
                .copy("Fixtures")
            ]),
    ]
)
