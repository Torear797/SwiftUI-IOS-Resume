//
//  AppDelegate.swift
//  SwiftUI-IOS-Resume
//
//  Created by Артём Клыч on 18.04.2024.
//

import DependencyInjection
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    private var coreAssembly: () = AppServiceAssembly.shared.assemble()
    
    // MARK: DI
    
//    @Inject private var analyticsKit: AnalyticsKit
//    @Inject private var deepLinkManager: DeepLinkManager
//    @Inject private var dayEventService: DayEventService
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
//        analyticsKit.configure()
//        deepLinkManager.configure()
//        dayEventService.configure()
        return true
    }
}
