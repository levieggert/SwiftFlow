//
//  OnboardingTutorialOneViewModel.swift
//  SwiftFlow-Example
//
//  Created by Levi Eggert on 10/21/20.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

class OnboardingTutorialOneViewModel: TemplateViewModelType {
    
    private weak var flowDelegate: FlowDelegate?
    
    let title: String = "Tutorial One"
    
    required init(flowDelegate: FlowDelegate) {
        
        self.flowDelegate = flowDelegate
    }
    
    func backTapped() {
        flowDelegate?.navigate(step: AppFlowStep.backTappedFromOnboardingTutorialOne)
    }
    
    func continueTapped() {
        flowDelegate?.navigate(step: AppFlowStep.continueTappedFromOnboardingTutorialOne)
    }
}
