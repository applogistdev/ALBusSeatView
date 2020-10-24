// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ALBusSeatView",
    products: [
        .library(
            name:"ALBusSeatView",
            targets: ["ALBusSeatView"]
        )
    ],
    targets: [
        .target(
            name: "ALBusSeatView",
            path: "ALBusSeatView"
        )
    ]
)