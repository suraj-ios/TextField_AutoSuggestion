//
//  ViewController.swift
//  TextFieldAutoSuggestion
//
//  Created by Nav146 on 04/07/18.
//  Copyright © 2018 Nav146. All rights reserved.
//

import UIKit
import UITextField_AutoSuggestion

class ViewController: UIViewController,UITextFieldAutoSuggestionDataSource {


    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField1: UITextField!
    
    var DATA = ["One","Two","Three","Four","Five","six","seven","eight","nine","Ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen","twenty"]
    //

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField1.autoSuggestionDataSource = self
        //self.textField1.showImmediately = false
        self.textField1.fieldIdentifier = "FIELD_ID"
        self.textField1.minCharsToShow = 3
        self.textField1.observeChanges()

    }

    func autoSuggestionField(_ field: UITextField!, tableView: UITableView!, cellForRowAt indexPath: IndexPath!, forText text: String!) -> UITableViewCell! {

        let cellIdentifier = "AutoSuggestionCell"

        var cell: UITableViewCell? = tableView?.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        // configure cell
        cell?.textLabel?.text = DATA[indexPath?.row ?? 0]

        return cell
    }

    func autoSuggestionField(_ field: UITextField!, tableView: UITableView!, numberOfRowsInSection section: Int, forText text: String!) -> Int {
        return DATA.count

    }
    //input value print
    func autoSuggestionField(_ field: UITextField!, textChanged text: String!) {

       // print(text)
    }
    func autoSuggestionField(_ field: UITextField!, tableView: UITableView!, heightForRowAt indexPath: IndexPath!, forText text: String!) -> CGFloat {

        return 50
    }
    func autoSuggestionField(_ field: UITextField!, tableView: UITableView!, didSelectRowAt indexPath: IndexPath!, forText text: String!) {

        self.textField1.text = self.DATA[indexPath.row]

    }

}

