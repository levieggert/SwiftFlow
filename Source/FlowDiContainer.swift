//
//  Created by Levi Eggert.
//  Copyright © 2020 Levi Eggert. All rights reserved.
//

import Foundation

public protocol FlowDiContainer {
    
    associatedtype DiContainer: FlowDiContainerType
    
    var diContainer: DiContainer { get }
}
