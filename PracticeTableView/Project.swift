import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeAppModule(
  name: "PracticeTableView",
  platform: .iOS,
  product: .app,
  packages: [
  ],
  dependencies: [
  ],
  sources: [
    "Sources/**"
  ],
  resources: [
    "Resources/**"
  ],
  infoPlist: .file(path: "SupportingFile/Info.plist")
)
