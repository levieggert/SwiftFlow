//
//  OnboardingTutorialTwoViewModel.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/21/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

class OnboardingTutorialTwoViewModel: TemplateViewModelType {
    
    private weak var flowDelegate: FlowDelegate?
    
    let title: String = "Tutorial Two"
    
    required init(flowDelegate: FlowDelegate) {
        
        self.flowDelegate = flowDelegate
    }
    
    func backTapped() {
        flowDelegate?.navigate(step: AppFlowStep.backTappedFromOnboardingTutorialTwo)
    }
    
    func continueTapped() {
        flowDelegate?.navigate(step: AppFlowStep.continueTappedFromOnboardingTutorialTwo)
    }
}
