//
//  ViewController.swift
//  imagePickr
//
//  Created by Robert DeLaurentis on 4/5/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)

    cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func chooseImage(_ sender: UIBarButtonItem) {

    let pickerController = UIImagePickerController()
    pickerController.delegate = self
    present(pickerController, animated: true, completion: nil)

  }

  @IBAction func takeImage(_ sender: UIBarButtonItem) {

    let pickerController = UIImagePickerController()
    pickerController.delegate = self

    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }

    pickerController.sourceType = .camera

    present(pickerController, animated: true, completion: nil)

  }
  

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    print("returned \(info["UIImagePickerControllerOriginalImage"]!)")
    imageView.image = info["UIImagePickerControllerOriginalImage"]! as? UIImage
    dismiss(animated: true, completion: nil)
  }


}

