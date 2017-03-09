//
//  SignupViewController.swift
//  BuChat3
//
//  Created by Richard McHugh on 08/03/2017.
//  Copyright © 2017 Richard McHugh. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let imagePicker = UIImagePickerController()
    var selectedPhoto: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.selectPhoto(tap:)))
        tap.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(tap)
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true
        
    }
    
    func selectPhoto(tap: UITapGestureRecognizer) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.imagePicker.sourceType = .camera
        } else {
            self.imagePicker.sourceType = .photoLibrary
        }
        
        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func CancelDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    @IBAction func SignupDidTapped(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, let username = usernameTextField.text, !username.isEmpty else {
            return
        }
        
        var data = NSData()
        data = UIImageJPEGRepresentation(profileImage.image!, 0.1)! as NSData
        DataService.dataService.Signup(username: username, email: email, password: password, data: data)
        
        
    }
    

}


extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        selectedPhoto = info[UIImagePickerControllerEditedImage] as? UIImage
        self.profileImage.image = selectedPhoto
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

