// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "CFFoundation", targets: ["CFFoundation"]),
        .library(name: "DependencyInjection", targets: ["DependencyInjection"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "HTTPClient", targets: ["HTTPClient"]),
        .library(name: "HTTPClientAPI", targets: ["HTTPClientAPI"]),
        .library(name: "UserDefaultManager", targets: ["UserDefaultManager"]),
        .library(name: "UserDefaultManagerAPI", targets: ["UserDefaultManagerAPI"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.8.0")
        ),
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            .upToNextMajor(from: "2.8.4")
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            .upToNextMajor(from: "7.0.0")
        ),
    ],
    targets: [
        .target(name: "CFFoundation"),
        .target(name: "DependencyInjection", dependencies: ["Swinject"]),
        .target(
            name: "DesignSystem",
            dependencies: ["CFFoundation", "Kingfisher"],
            resources: [.process("Resources")]
        ),
        .target(name: "HTTPClient", dependencies: ["HTTPClientAPI"]),
        .target(name: "HTTPClientAPI", dependencies: ["Alamofire"]),
        .target(
            name: "UserDefaultManager",
            dependencies: ["UserDefaultManagerAPI"]
        ),
        .target(name: "UserDefaultManagerAPI"),
    ]
)
