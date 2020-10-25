//
//  SignInViewModel.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/22/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

class SignInViewModel: TemplateViewModelType {
    
    private weak var flowDelegate: FlowDelegate?
    
    let title: String = "Sign In"
    
    required init(flowDelegate: FlowDelegate) {
        
        self.flowDelegate = flowDelegate
    }
    
    func backTapped() {
        flowDelegate?.navigate(step: AppFlowStep.backTappedFromSignIn)
    }
    
    func continueTapped() {
        flowDelegate?.navigate(step: AppFlowStep.userDidSignInFromSignIn)
    }
}
