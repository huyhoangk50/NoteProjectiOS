//
//  NoteDetaildViewController.swift
//  CustomListView
//
//  Created by ComVis on 9/18/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var note: Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if note != nil{
            timeLabel.text = note.time
            contentLabel.text = note.content
            titleLabel.text = note.title
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
