// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "Devices", targets: ["Devices"]),
        .library(name: "DevicesAPI", targets: ["DevicesAPI"]),
        .library(name: "Films", targets: ["Films"]),
        .library(name: "FilmsAPI", targets: ["FilmsAPI"]),
        .library(name: "Navigation", targets: ["Navigation"]),
        .library(name: "NavigationAPI", targets: ["NavigationAPI"]),
        .library(name: "Profile", targets: ["Profile"]),
        .library(name: "ProfileAPI", targets: ["ProfileAPI"]),
        .library(name: "Store", targets: ["Store"]),
        .library(name: "WebDataSource", targets: ["WebDataSource"]),
        .library(name: "WebDataSourceAPI", targets: ["WebDataSourceAPI"]),
    ],
    dependencies: [.package(path: "../Core")],
    targets: [
        .target(
            name: "Films",
            dependencies: [
                .product(name: "DesignSystem", package: "Core"),
                .product(name: "DependencyInjection", package: "Core"),
                "FilmsAPI",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "FilmsAPI",
            dependencies: [.product(name: "CFFoundation", package: "Core")]
        ),
        .target(
            name: "Devices",
            dependencies: [
                .product(name: "DesignSystem", package: "Core"),
                .product(name: "DependencyInjection", package: "Core"),
                "DevicesAPI",
                "Profile",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "DevicesAPI",
            dependencies: [.product(name: "CFFoundation", package: "Core")]
        ),
        .target(
            name: "Navigation",
            dependencies: [
                "NavigationAPI",
                "Films",
                "Devices",
                "Store",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "Profile",
            dependencies: [
                .product(name: "DesignSystem", package: "Core"),
                .product(name: "DependencyInjection", package: "Core"),
                .product(name: "UserDefaultManagerAPI", package: "Core"),
                "ProfileAPI"
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "ProfileAPI",
            dependencies: [
            ]
        ),
        .target(
            name: "NavigationAPI",
            dependencies: [.product(name: "CFFoundation", package: "Core")],
            resources: [.process("Resources")]
        ),
        .target(
            name: "Store",
            dependencies: [
                .product(name: "CFFoundation", package: "Core"),
                .product(name: "DesignSystem", package: "Core"),
                .product(name: "UserDefaultManagerAPI", package: "Core"),
                "DevicesAPI",
                "Profile",
            ],
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
                "FilmsAPI",
                "DevicesAPI",
                "ProfileAPI",
            ]
        ),
    ]
)
