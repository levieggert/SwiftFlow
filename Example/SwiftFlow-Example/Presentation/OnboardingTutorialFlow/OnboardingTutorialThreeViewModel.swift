//
//  OnboardingTutorialThreeViewModel.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/21/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

class OnboardingTutorialThreeViewModel: TemplateViewModelType {
    
    private weak var flowDelegate: FlowDelegate?
    
    let title: String = "Tutorial Three"
    
    required init(flowDelegate: FlowDelegate) {
        
        self.flowDelegate = flowDelegate
    }
    
    func backTapped() {
        flowDelegate?.navigate(step: AppFlowStep.backTappedFromOnboardingTutorialThree)
    }
    
    func continueTapped() {
        flowDelegate?.navigate(step: AppFlowStep.continueTappedFromOnboardingTutorialThree)
    }
}
