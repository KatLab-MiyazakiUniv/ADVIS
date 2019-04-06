//
//  LottieView.swift
//  lottie-swift-iOS
//
//  Created by Brandon Withrow on 2/6/19.
//

import AppKit
import Foundation

public enum LottieContentMode {
    case bottom
    case bottomLeft
    case bottomRight
    case center
    case left
    case redraw
    case right
    case scaleToFill
    case scaleAspectFit
    case scaleAspectFill
    case top
    case topLeft
    case topRight
}

/// A wrapper around NSView for cross platform compatibility.

public class LottieView: NSView {
    var screenScale: CGFloat {
        return NSApp.mainWindow?.backingScaleFactor ?? 1
    }

    var viewLayer: CALayer? {
        return layer
    }

    func layoutAnimation() {}

    func animationMovedToWindow() {}

    public override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        animationMovedToWindow()
    }

    func commonInit() {
        wantsLayer = true
    }

    func setNeedsLayout() {
        needsLayout = true
    }

    func layoutIfNeeded() {}

    public override var wantsUpdateLayer: Bool {
        return true
    }

    public override var isFlipped: Bool {
        return true
    }

    public var contentMode: LottieContentMode = .scaleAspectFit {
        didSet {
            setNeedsLayout()
        }
    }

    public override func layout() {
        super.layout()
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        layoutAnimation()
        CATransaction.commit()
    }

    @objc func animationWillMoveToBackground() {}

    @objc func animationWillEnterForeground() {}
}
