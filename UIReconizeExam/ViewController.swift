//
//  ViewController.swift
//  UIReconizeExam
//
//  Created by techmaster on 11/2/16.
//  Copyright © 2016 MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let tapGestute = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(_:)))
//        self.view.addGestureRecognizer(tapGestute)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onTap(_ tapGesture: UITapGestureRecognizer) {
        let point = tapGesture.location(in: self.view)
        let spideyIcon = UIImageView(image: UIImage(named: "spidey.jpg"))
        spideyIcon.bounds.size = CGSize(width: 40, height: 40)
        spideyIcon.center = point;
        self.view.addSubview(spideyIcon)
    }
}

