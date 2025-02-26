// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: [],
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile"
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .unsafeFlags(["-L", "Libs"]),
                .linkedLibrary("wg-go")
            ]
        )
    ]
)
