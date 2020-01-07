//
//  AnimatedSwitch.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 2/4/19.
//

import Foundation
import UIKit
/**
 An interactive switch with an 'On' and 'Off' state. When the user taps on the
 switch the state is toggled and the appropriate animation is played.

 Both the 'On' and 'Off' have an animation play range associated with their state.
 */
public final class AnimatedSwitch: AnimatedControl {
    /// The current state of the switch.
    public var isOn: Bool {
        set {
            /// This is forwarded to a private variable because the animation needs to be updated without animation when set externally and with animation when set internally.
            guard _isOn != newValue else { return }
            updateOnState(isOn: newValue, animated: false)
            accessibilityValue = newValue ? NSLocalizedString("On", comment: "On") : NSLocalizedString("Off", comment: "Off")
        }
        get {
            return _isOn
        }
    }

    /// Sets the play range for the given state. When the switch is toggled, the animation range is played.
    public func setProgressForState(fromProgress: AnimationProgressTime,
                                    toProgress: AnimationProgressTime,
                                    forOnState: Bool) {
        if forOnState {
            onStartProgress = fromProgress
            onEndProgress = toProgress
        } else {
            offStartProgress = fromProgress
            offEndProgress = toProgress
        }

        updateOnState(isOn: _isOn, animated: false)
    }

    public override init(animation: Animation) {
        /// Generate a haptic generator if available.
        #if os(iOS)
            if #available(iOS 10.0, *) {
                self.hapticGenerator = HapticGenerator()
            } else {
                hapticGenerator = NullHapticGenerator()
            }
        #else
            hapticGenerator = NullHapticGenerator()
        #endif
        super.init(animation: animation)
        updateOnState(isOn: _isOn, animated: false)
        accessibilityTraits = UIAccessibilityTraits.button
    }

    public override init() {
        /// Generate a haptic generator if available.
        #if os(iOS)
            if #available(iOS 10.0, *) {
                self.hapticGenerator = HapticGenerator()
            } else {
                hapticGenerator = NullHapticGenerator()
            }
        #else
            hapticGenerator = NullHapticGenerator()
        #endif
        super.init()
        updateOnState(isOn: _isOn, animated: false)
        accessibilityTraits = UIAccessibilityTraits.button
    }

    public required init?(coder aDecoder: NSCoder) {
        /// Generate a haptic generator if available.
        #if os(iOS)
            if #available(iOS 10.0, *) {
                self.hapticGenerator = HapticGenerator()
            } else {
                hapticGenerator = NullHapticGenerator()
            }
        #else
            hapticGenerator = NullHapticGenerator()
        #endif
        super.init(coder: aDecoder)
        accessibilityTraits = UIAccessibilityTraits.button
    }

    fileprivate var onStartProgress: CGFloat = 0
    fileprivate var onEndProgress: CGFloat = 1
    fileprivate var offStartProgress: CGFloat = 1
    fileprivate var offEndProgress: CGFloat = 0
    fileprivate var _isOn: Bool = false
    fileprivate var hapticGenerator: ImpactGenerator

    // MARK: Animation State

    func updateOnState(isOn: Bool, animated: Bool) {
        _isOn = isOn
        var startProgress = isOn ? onStartProgress : offStartProgress
        var endProgress = isOn ? onEndProgress : offEndProgress
        let finalProgress = endProgress

        let realtimeProgress = animationView.realtimeAnimationProgress

        let previousStateStart = isOn ? offStartProgress : onStartProgress
        let previousStateEnd = isOn ? offEndProgress : onEndProgress
        if realtimeProgress.isInRange(min(previousStateStart, previousStateEnd),
                                      max(previousStateStart, previousStateEnd)) {
            /// Animation is currently in the previous time range. Reverse the previous play.
            startProgress = previousStateEnd
            endProgress = previousStateStart
        }

        guard animated == true else {
            animationView.currentProgress = finalProgress
            return
        }
        hapticGenerator.generateImpact()
        animationView.play(fromProgress: startProgress, toProgress: endProgress, loopMode: LottieLoopMode.playOnce) { finished in
            if finished == true {
                self.animationView.currentProgress = finalProgress
            }
        }
    }

    public override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        updateOnState(isOn: !_isOn, animated: true)
        sendActions(for: .valueChanged)
    }

    public override func animationDidSet() {
        updateOnState(isOn: _isOn, animated: true)
    }
}

protocol ImpactGenerator {
    func generateImpact()
}

class NullHapticGenerator: ImpactGenerator {
    func generateImpact() {}
}

#if os(iOS)
    @available(iOS 10.0, *)
    class HapticGenerator: ImpactGenerator {
        func generateImpact() {
            impact.impactOccurred()
        }

        fileprivate let impact = UIImpactFeedbackGenerator(style: .light)
    }
#endif