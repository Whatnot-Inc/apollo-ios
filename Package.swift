// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LegacyApollo",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5)
  ],
  products: [
    .library(
      name: "LegacyApollo",
      targets: ["LegacyApollo"]),
    .library(
      name: "LegacyApolloAPI",
      targets: ["LegacyApolloAPI"]),
    .library(
      name: "LegacyApolloUtils",
      targets: ["LegacyApolloUtils"]),
    .library(
      name: "LegacyApollo-Dynamic",
      type: .dynamic,
      targets: ["LegacyApollo"]),
    .library(
      name: "LegacyApolloCodegenLib",
      targets: ["LegacyApolloCodegenLib"]),
    .library(
      name: "LegacyApolloWebSocket",
      targets: ["LegacyApolloWebSocket"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "LegacyApollo",
      dependencies: [
        "LegacyApolloAPI",
        "LegacyApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "LegacyApolloAPI",
      dependencies: [],
      exclude: [
        "Info.plist",
        "CodegenV1"
      ]),
    .target(
      name: "LegacyApolloUtils",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "LegacyApolloCodegenLib",
      dependencies: [
        "LegacyApolloUtils",
      ],
      exclude: [
        "Info.plist",
        "Frontend/JavaScript",
      ],
      resources: [
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js"),
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js.map")
      ]),
    .target(
      name: "LegacyApolloWebSocket",
      dependencies: [
        "LegacyApollo",
        "LegacyApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ])
  ]
)
