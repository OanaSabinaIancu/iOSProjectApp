//
//  LoginViewController.swift
//  proiect-opt-Sabina-Iancu-311
//
//  Created by user215930 on 5/1/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.addTarget((self), action: #selector(self.animate(sender:)), for: .touchUpInside)
        
        signUpButton.addTarget((self), action: #selector(self.animate(sender:)), for: .touchUpInside)
    }
    

    @objc fileprivate func animate(sender: UIButton){
        print("Works for me")
        self.animateView(sender)
        self.animateViewColor(sender)
        
    }
    
    fileprivate func animateViewColor(_ viewToAnimate: UIView){
        UIView.animate(withDuration: 0.15, animations: {
            viewToAnimate.backgroundColor = UIColor.systemPink
            print("works this too")
        }, completion: { (_) in
            viewToAnimate.backgroundColor = UIColor.systemBlue
            print("i'm happy now")
        })

    }
    
    fileprivate func animateView(_ viewToAnimate: UIView){
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        } completion: { (_) in
            print("Animation complete")
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn) {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { (_) in
                
            }

        }

    }
    
    

}
