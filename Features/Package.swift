// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "Films", targets: ["Films"]),
        .library(name: "FilmsAPI", targets: ["FilmsAPI"]),
        .library(name: "Navigation", targets: ["Navigation"]),
        .library(name: "NavigationAPI", targets: ["NavigationAPI"]),
        .library(name: "WebDataSource", targets: ["WebDataSource"]),
        .library(name: "WebDataSourceAPI", targets: ["WebDataSourceAPI"]),
    ],
    dependencies: [.package(path: "../Core")],
    targets: [
        .target(
            name: "Films",
            dependencies: [
                .product(name: "DesignSystem", package: "Core"),
                "FilmsAPI",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "FilmsAPI",
            dependencies: [.product(name: "CFFoundation", package: "Core")]
        ),
        .target(
            name: "Navigation",
            dependencies: [
                "NavigationAPI",
                "Films",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "NavigationAPI",
            dependencies: [.product(name: "CFFoundation", package: "Core")],
            resources: [.process("Resources")]
        ),
        .target(
            name: "WebDataSource",
            dependencies: [
                .product(name: "DependencyInjection", package: "Core"),
                "WebDataSourceAPI"
            ]
        ),
        .target(
            name: "WebDataSourceAPI",
            dependencies: [
                .product(name: "HTTPClientAPI", package: "Core"),
                "FilmsAPI"
            ]
        ),
    ]
)
