//
//  OnboardingWelcomeViewModel.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/21/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

class OnboardingWelcomeViewModel: TemplateViewModelType {
    
    private weak var flowDelegate: FlowDelegate?
    
    let title: String = "Welcome"
    
    required init(flowDelegate: FlowDelegate) {
        
        self.flowDelegate = flowDelegate
    }
    
    func backTapped() {
        
    }
    
    func continueTapped() {
        flowDelegate?.navigate(step: AppFlowStep.continueTappedFromWelcome)
    }
}
