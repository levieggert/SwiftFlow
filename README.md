SwiftFlow
=========

- Version 1.0.0
- Swift 5.0

A simple coordinator for handling app navigation.  Inspired by RxFlow.

- [Cocoapods Installation](#cocoapods)
- [Brief Overview Of Classes](#brief-overview-of-classes)
- [How To Use SwiftFlow](#how-to-use-swiftflow)

### Cocoapods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SwiftFlow', '1.0.0'
end
```
### Brief Overview Of Classes
SwiftFlow is broken into these classes.
- **Flow** This class handles flow navigation by push, set, or present.  All flows have a navigation controller and an optional parent FlowDelegate for communicating navigation to it's parent flow.  The parent FlowDelegate is typically used when a flow is exited (dismissed, back navigation) and the parent flow needs to dismiss the child flow or do cleanup.

- **FlowDelegate** A protocol that Flow adopts for handling navigation steps (actions).  A step conforms to protocol FlowStepType.  Here you can provide your own FlowStepType in the form of an enum where each case represents a navigation action.  For example, user taps continue button from the welcome screen.

- **FlowDiContainer** A protocol your custom Flows can adopt if they require a dependency container for injecting dependencies.

- **FlowDiContainerType** This protocol is a constraint on the FlowDiContainer's  DiContainer associated type.  Your custom DiContainer's will adopt this protocol.

- **FlowStepType** A protocol that is passed to the FlowDelegate's navigate function.  Your custom enum will adopt this protocol and provide cases as navigation steps (actions).

### How To Use SwiftFlow
