// swift-tools-version:5.3
import PackageDescription

let version = "0.37.1"
let xcframework_name = "jsonschemavalidator"
let binary_target_url_github_owner = "swiyu-admin-ch"
let binary_target_url_github_repo = "jsonschema-swift"
let checksum = "cb0e0dee49210a9b67d694a145f5ff909f3e3104f9f996ba153e7ccefe9d28fd"

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
