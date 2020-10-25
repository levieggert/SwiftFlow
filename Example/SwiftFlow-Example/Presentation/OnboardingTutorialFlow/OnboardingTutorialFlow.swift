//
//  OnboardingTutorialFlow.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/21/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import UIKit

class OnboardingTutorialFlow: Flow, FlowDiContainer {
    
    private var signInFlow: SignInFlow?
        
    let diContainer: AppDiContainer
            
    required init(flowDelegate: FlowDelegate, diContainer: AppDiContainer) {
        
        self.diContainer = diContainer
        
        super.init()
    }
    
    deinit {
        self.signInFlow = nil
    }
    
    override func initialView() -> UIViewController {
        
        let viewModel = OnboardingTutorialOneViewModel(
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
           
        case .backTappedFromOnboardingTutorialOne:
            parentFlowDelegate?.navigate(step: AppFlowStep.backTappedFromOnboardingTutorialOne)
            
        case .continueTappedFromOnboardingTutorialOne:
            
            let viewModel = OnboardingTutorialTwoViewModel(
                flowDelegate: self
            )
            let view = TemplateView(viewModel: viewModel)
            
            navigationController.pushViewController(view, animated: true)
            
        case .backTappedFromOnboardingTutorialTwo:
            navigationController.popViewController(animated: true)
            
        case .continueTappedFromOnboardingTutorialTwo:
            
            let viewModel = OnboardingTutorialThreeViewModel(
                flowDelegate: self
            )
            let view = TemplateView(viewModel: viewModel)
            
            navigationController.pushViewController(view, animated: true)
            
        case .backTappedFromOnboardingTutorialThree:
            navigationController.popViewController(animated: true)
            
        case .continueTappedFromOnboardingTutorialThree:

            let signInFlow: SignInFlow = SignInFlow(flowDelegate: self, diContainer: diContainer)
            pushFlow(flow: signInFlow, animated: true)
            self.signInFlow = signInFlow
        
        case .backTappedFromSignIn:
            
            navigationController.popViewController(animated: true)
            self.signInFlow = nil
            
        case .userDidSignInFromSignIn:
            parentFlowDelegate?.navigate(step: AppFlowStep.userDidSignInFromSignIn)
            
        default:
            break
        }
    }
}
