import ProjectDescription

public extension Project {
  
  static let organizationName = "com.jeonghi"
  static let targetVersion = "16.0"
  
  static func makeAppModule(
    name: String,
    platform: Platform = .iOS,
    product: Product,
    organizationName: String = organizationName,
    packages: [Package] = [],
    deploymentTarget: DeploymentTarget? = .iOS(targetVersion: targetVersion, devices: [.iphone]),
    dependencies: [TargetDependency] = [],
    sources: SourceFilesList = ["Sources/**"],
    resources: ResourceFileElements? = nil,
    infoPlist: InfoPlist = .default,
    entitlements: Entitlements? = nil
  ) -> Project {
    let settings: Settings = .settings(defaultSettings: .recommended)
    
    let appTarget = Target(
      name: name,
      platform: platform,
      product: product,
      bundleId: "\(organizationName).\(name)",
      deploymentTarget: deploymentTarget,
      infoPlist: infoPlist,
      sources: sources,
      resources: resources,
      entitlements: entitlements,
      dependencies: dependencies
    )
    
    let testTarget = Target(
      name: "\(name)Tests",
      platform: platform,
      product: .unitTests,
      bundleId: "\(organizationName).\(name)Tests",
      deploymentTarget: deploymentTarget,
      infoPlist: .default,
      sources: ["Tests/**"],
      entitlements: entitlements,
      dependencies: [.target(name: name)]
    )
    
    let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]
    
    let targets: [Target] = [appTarget, testTarget]
    
    return Project(
      name: name,
      organizationName: organizationName,
      packages: packages,
      settings: settings,
      targets: targets,
      schemes: schemes
    )
  }
}
