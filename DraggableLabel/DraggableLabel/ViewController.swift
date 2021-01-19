//
//  ViewController.swift
//  DraggableLabel
//
//  Created by Poto on 2021/01/19.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    func setup() {
        let dragableLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        dragableLabel.center = view.center
        dragableLabel.textAlignment = .center
        dragableLabel.text = "드래그로 이동하기"
        dragableLabel.isUserInteractionEnabled = true
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        dragableLabel.addGestureRecognizer(gestureRecognizer)
        
        self.view.addSubview(dragableLabel)
    }

    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {

            let translation = gestureRecognizer.translation(in: self.view)
            
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
}

