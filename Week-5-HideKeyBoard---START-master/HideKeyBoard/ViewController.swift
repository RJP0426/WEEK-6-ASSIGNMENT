//
//  ViewController.swift
//  HideKeyBoard
//
//  Created by Charles Konkol on 2/9/15.
//  Copyright (c) 2017 Rock Valley College. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var txtContacts: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZIP: UITextField!
    // 1) Add MessageBox function using AlertView
    func MsgBox(_ message:String)
    {
        let alert = UIAlertView()
        alert.title = "WAIT"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    // 2) Add touchesBegan function to catch screen tap and resign keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZIP.endEditing(true)
        
        
        
    }
    
    // 3) Add DismissKeyboard function to resign keyboard on all textboxes
    func DismissKeyboard(){
        
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZIP.endEditing(true)
    }
    
    //  4) Add textFieldShouldReturn function. This is called when 'return' key pressed on any UITextField. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        
        return true;
    }
    
    //  5) Add textFieldDidBeginEditing function. ScrollPoint when entering UItextfied
    func textFieldDidBeginEditing(_ textField:UITextField){
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    // 6) Add textFieldDidEndEditing function. ScrollPoint when done editing UItextfied
    func textFieldDidEndEditing(_ textField:UITextField){
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    // 7) Add textViewDidBeginEditing function. ScrollPoint when entering UItextView
    func textViewDidBeginEditing(_ textField:UITextView){
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        
        ScrollView.setContentOffset(scrollPoint, animated: true)    }
    
    // 8) Add textViewDidEndEditing function. ScrollPoint when done ending UItextView
    func textViewDidEndEditing(_ textField:UITextView){
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    
    // 9) Modify existing viewDidLoad function. Default Function to load when view is shown
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        
        //4.Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
        
        ScrollView.addGestureRecognizer(tap)
        
        //5.gets ScreenSize of current device
        
        let size: CGRect = UIScreen.main.bounds
        
        //6.Go to left  = 0 pixels, top = 50 pixels, width or device in pixels, height of device in pixels
        
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        
        //7.Set focus on txtFirst
        
        txtFirst.becomeFirstResponder()
        
    }
    
    // 10) Default didReceiveMemoryWarning Function to dispose of memory automatically.Leave this function alone
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // 11) Modify btnBack function. Goes back to original ScrollView position
    @IBAction func btnBack(_ sender: UIButton) {
        //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
        
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        //set txtFirst as firstresponder
        
        txtFirst.becomeFirstResponder()
        
    }
    
    // 12) Modify btnView functions. Goes to position in ScrollView where the btnBack button is
    @IBAction func btnView(_ sender: UIButton) {
        //hide keyboard
        DismissKeyboard()
        
        //declare CGPoint scrollPoint
        var scrollPoint:CGPoint
        
        //X = from Left, Y = from Top
        //get X = 0, Y = location of btnBack Y
        scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
        
        //Set ScrollPoint and Go to animated
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    //  13) Modify btnSave function. Validates UITextfields have content, formats text to place in UITextView txtContacts, Goes to location of btnBack button.
    @IBAction func btnSave(_ sender: UIButton) {
        //Add Below Code from "Code for Steps.txt". Fulfill Each Comment With Code
        
        //hide keyboard
        
        DismissKeyboard()
        
        //validation that all fields are entered
        
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="" || txtAddress.text=="" || txtCity.text=="" || txtState.text=="" || txtZIP.text=="")
        {
            
            MsgBox("All information is required, please correct")
            
        }
        else
        {
            if (txtContacts.text=="")
            {
                txtContacts.text = "MyContacts \n"
                
            }
            txtContacts.text = "\(txtContacts.text!) \n \(txtFirst.text!) \n \(txtLast.text!) \n \(txtEmail.text!) \n \(txtAddress.text!) \n \(txtCity.text!) \n \(txtState.text!) \n \(txtZIP.text!) \n"
            txtFirst.text = ""
            txtLast.text = ""
            txtEmail.text = ""
            txtAddress.text = ""
            txtCity.text = ""
            txtState.text = ""
            txtZIP.text = ""
            var scrollPoint:CGPoint
            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            ScrollView.setContentOffset(scrollPoint, animated: true)
        }
        
        
        
        
        
    }}
