//
//  Item.swift
//  UIReconizeExam
//
//  Created by techmaster on 11/2/16.
//  Copyright © 2016 MD. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        // hold and pull
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Item.onPan(_:)))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(Item.onPinch(_:)))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(Item.onRotate(_:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    
    func onPan(_ panGesture: UIPanGestureRecognizer) {
        if panGesture.state == .began || panGesture.state == .changed {
            let point = panGesture.location(in: self.superview)
            self.center = point
        }
    }
    
    func onPinch(_ pinchGesture: UIPinchGestureRecognizer) {
        if let view = pinchGesture.view {
            view.transform = view.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
            pinchGesture.scale = 1
        }
    }
    
    func onRotate(_ rotateGesture: UIRotationGestureRecognizer) {
        if let view = rotateGesture.view {
            view.transform = view.transform.rotated(by: rotateGesture.rotation)
            rotateGesture.rotation = 0
        }
        
    }
    // two action in same time
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
        return true
    }
}
