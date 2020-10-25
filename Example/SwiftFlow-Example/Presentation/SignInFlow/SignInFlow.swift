//
//  SignInFlow.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/22/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import UIKit

class SignInFlow: Flow, FlowDiContainer {
        
    let diContainer: AppDiContainer
        
    required init(flowDelegate: FlowDelegate, diContainer: AppDiContainer) {
        self.diContainer = diContainer
        
        super.init()
    }
    
    deinit {

    }
    
    override func initialView() -> UIViewController {
        
        let viewModel = SignInViewModel(flowDelegate: self)
        let view = TemplateView(viewModel: viewModel)
        
        return view
    }
    
    override func navigate(step: FlowStepType) {
        
        guard let appStep = step as? AppFlowStep else {
            return
        }
                
        switch appStep {
            
        case .backTappedFromSignIn:
            parentFlowDelegate?.navigate(step: AppFlowStep.backTappedFromSignIn)
            
        case .userDidSignInFromSignIn:
            parentFlowDelegate?.navigate(step: AppFlowStep.userDidSignInFromSignIn)
                                        
        default:
            break
        }
    }
}
