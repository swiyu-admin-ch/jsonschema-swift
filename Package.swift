// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "JsonSchemaValidator",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "JsonSchemaValidator",targets:["JsonSchemaValidatorSources"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "JsonSchemaValidatorWrapper",
            dependencies:[
                .target(name:"JsonSchemaValidator", condition: .when(platforms: [.iOS]))
            ],
            path: "JsonSchemaValidatorWrapper",
            cSettings: [
                .headerSearchPath("."),
                .unsafeFlags(["-fmodule-map-file=Headers/jsonschemavalidator.modulemap"])
            ]
        ),
        .binaryTarget(
            name: "JsonSchemaValidator",
            path: "./jsonschemavalidator.xcframework",
            cSettings: [
                .headerSearchPath("."),
                .unsafeFlags(["-fmodule-map-file=Headers/jsonschemavalidator.modulemap"])
            ]
        ),
        .target(
            name: "JsonSchemaValidatorSources",
            dependencies: ["JsonSchemaValidatorWrapper"],
            path: "swift-sources",
            cSettings: [
                .headerSearchPath("."),
                .unsafeFlags(["-fmodule-map-file=Headers/jsonschemavalidator.modulemap"])
            ]
        )
    ]
)
