// swift-tools-version:5.3
import PackageDescription

let version = "0.46.4"
let xcframework_name = "jsonschemavalidator"
let binary_target_url_github_owner = "swiyu-admin-ch"
let binary_target_url_github_repo = "jsonschema-swift"
let checksum = "00d845cdd6afb80e06002c80592627709a1cb678c2c61e4f2e6d240acadf171d"

let package = Package(
    name: "JsonSchemaValidator",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "JsonSchemaValidator",
            targets: ["JsonSchemaValidator"]),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "JsonSchemaValidatorRemoteBinaryPackage",
            url: "https://github.com/\(binary_target_url_github_owner)/\(binary_target_url_github_repo)/releases/download/\(version)/\(xcframework_name)-\(version).xcframework.zip",
            checksum: "\(checksum)"
        ),
        .target(
            name: "JsonSchemaValidator",
            dependencies: ["JsonSchemaValidatorRemoteBinaryPackage"]
        )
    ]
)
