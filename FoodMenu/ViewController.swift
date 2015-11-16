//
//  ViewController.swift
//  FoodMenu
//
//  Created by Markim Shaw on 11/11/15.
//  Copyright © 2015 Markim Shaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var defaultImage: UIImage?
    
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        if let meal = meal{
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.image
            ratingControl.rating = meal.rating
            
        } else {
            navigationItem.title = "Add item"
        }
        
        defaultImage = photoImageView.image!
        checkValidMealName()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //UIDelegate

    //Actions
    @IBAction func setDefaultLabelText(sender: AnyObject) {
        mealNameLabel.text = "Default Label"
        photoImageView.image = defaultImage
        
    }
    
    @IBAction func selectImageFromLibrary(sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        
        
        imagePickerController.sourceType = .PhotoLibrary
        
        
        imagePickerController.delegate = self
        
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    //UIDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkValidMealName(){
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        //mealNameLabel.text = textField.text
        
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode{
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender{
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, image: photo, rating: rating)
        }
    }
    
    
}

