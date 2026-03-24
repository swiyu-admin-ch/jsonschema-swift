// swift-tools-version:5.3
import PackageDescription

let version = "main"
let xcframework_name = "jsonschemavalidator"
let binary_target_url_github_owner = "swiyu-admin-ch"
let binary_target_url_github_repo = "jsonschema-swift"
let checksum = "4c069de252e35b4e57f5c99374fd55a2dab0a0372bd8cde8b4cd77cb89a5a09e"

let package = Package(
    name: "JsonSchemaValidator",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "JsonSchemaValidator",
            targets: ["JsonSchemaValidator", "JsonSchemaValidatorRemoteBinaryPackage"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "JsonSchemaValidator"
        ),
        .binaryTarget(
            name: "JsonSchemaValidatorRemoteBinaryPackage",
            url: "https://github.com/\(binary_target_url_github_owner)/\(binary_target_url_github_repo)/releases/download/\(version)/\(xcframework_name)-\(version).xcframework.zip",
            checksum: "\(checksum)"
        )
    ]
)
