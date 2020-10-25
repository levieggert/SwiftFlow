//
//  Created by Levi Eggert.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import UIKit

class AppFlow: Flow, FlowDiContainer {
        
    private var onboardingFlow: OnboardingFlow?
    private var navigationStarted: Bool = false
    private var observersAdded: Bool = false
    private var appIsInBackground: Bool = false
    
    let diContainer: AppDiContainer
            
    required init(diContainer: AppDiContainer) {
        
        self.diContainer = diContainer
              
        super.init()
        
        navigationController.view.backgroundColor = UIColor.white
        navigationController.setNavigationBarHidden(false, animated: false)
                
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    override func initialView() -> UIViewController {
        return navigationController
    }
    
    override func navigate(step: FlowStepType) {
        
        guard let appStep = step as? AppFlowStep else {
            return
        }
                
        switch appStep {
            
        case .appLaunchedFromTerminatedState:
            navigateToOnboardingFlow(animated: true)
            
        case .appLaunchedFromBackgroundState:
            break
               
        case .userDidSignInFromSignIn:
            dismissOnboardingFlow(animated: true)
            
        default:
            break
        }
    }
    
    private func navigateToOnboardingFlow(animated: Bool) {
        
        let onboardingFlow = OnboardingFlow(flowDelegate: self, diContainer: diContainer)
        presentFlow(flow: onboardingFlow, animated: animated, completion: nil)
        self.onboardingFlow = onboardingFlow
    }
    
    private func dismissOnboardingFlow(animated: Bool) {
        
        if let onboardingFlow = self.onboardingFlow {
            dismissFlow(flow: onboardingFlow, animated: animated, completion: nil)
            self.onboardingFlow = nil
        }
    }
    
    private func addObservers() {
                
        if !observersAdded {
            
            observersAdded = true
            
            NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: UIApplication.didBecomeActiveNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        }
    }
    
    private func removeObservers() {
        
        if observersAdded {
            
            observersAdded = false
            
            NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        }
    }
    
    @objc func handleNotification(notification: Notification) {
        
        if notification.name == UIApplication.didBecomeActiveNotification {
            
            if !navigationStarted {
                navigationStarted = true
                navigate(step: AppFlowStep.appLaunchedFromTerminatedState)
            }
            else if appIsInBackground {
                appIsInBackground = false
                navigate(step: AppFlowStep.appLaunchedFromBackgroundState)
            }
        }
        else if notification.name == UIApplication.didEnterBackgroundNotification {
            appIsInBackground = true
        }
    }
}
