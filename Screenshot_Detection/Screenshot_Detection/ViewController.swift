//
//  ViewController.swift
//  Screenshot_Detection
//
//  Created by Poto on 2021/01/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenshotDetection()
    }
    
    private func screenshotDetection() {
        let mainQueue = OperationQueue.main
        
        NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: mainQueue)
        {
            notification in
            // 스크린샷 이후 처리
            let alert = UIAlertController(title: "알림", message: "스크린샷이 감지됨.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }


}

