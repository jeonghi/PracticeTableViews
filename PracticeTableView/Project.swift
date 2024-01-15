import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeAppModule(
  name: "PracticeTableView",
  platform: .iOS,
  product: .app,
  packages: [
    .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.0.0")),
    .remote(url: "https://github.com/evgenyneu/Cosmos.git", requirement: .upToNextMajor(from: "24.0.0"))
  ],
  dependencies: [
    .package(product: "Kingfisher"),
    .package(product: "Cosmos")
  ],
  sources: [
    "Sources/**"
  ],
  resources: [
    "Resources/**"
  ],
  infoPlist: .file(path: "SupportingFile/Info.plist")
)
