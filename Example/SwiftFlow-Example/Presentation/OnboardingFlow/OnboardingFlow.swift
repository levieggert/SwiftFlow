//
//  OnboardingFlow.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/21/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import UIKit

class OnboardingFlow: Flow, FlowDiContainer {
    
    private var tutorialFlow: OnboardingTutorialFlow?
        
    let diContainer: AppDiContainer
            
    required init(flowDelegate: FlowDelegate, diContainer: AppDiContainer) {        
        
        self.diContainer = diContainer
        
        super.init()
        
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.view.backgroundColor = UIColor.white
        navigationController.setNavigationBarHidden(false, animated: false)
    }
    
    deinit {
        self.tutorialFlow = nil
    }
    
    override func initialView() -> UIViewController {
        
        let viewModel = OnboardingWelcomeViewModel(
            flowDelegate: self
        )
        let view = TemplateView(viewModel: viewModel)
        
        return view
    }
    
    override func navigate(step: FlowStepType) {
        
        guard let appStep = step as? AppFlowStep else {
            return
        }
        
        switch appStep {
       
        case .continueTappedFromWelcome:
            
            let tutorialFlow = OnboardingTutorialFlow(
                flowDelegate: self,
                diContainer: diContainer
            )
            pushFlow(flow: tutorialFlow, animated: true)
            
            self.tutorialFlow = tutorialFlow
            
        case .backTappedFromOnboardingTutorialOne:
            
            navigationController.popViewController(animated: true)
            self.tutorialFlow = nil
            
        case .userDidSignInFromSignIn:
            parentFlowDelegate?.navigate(step: AppFlowStep.userDidSignInFromSignIn)
            
        default:
            break
        }
    }
}
