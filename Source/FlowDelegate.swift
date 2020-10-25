//
//  Created by Levi Eggert.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

public protocol FlowDelegate: class {
            
    func navigate(step: FlowStepType)
}
