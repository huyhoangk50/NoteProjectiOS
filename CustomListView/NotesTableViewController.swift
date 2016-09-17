//
//  NotesTableViewController.swift
//  CustomListView
//
//  Created by ComVis on 9/14/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    //MARK: propeties
    @IBOutlet weak var noteBarButtonItem: UIBarButtonItem!
    var notes  = [Note]()
    var noteDb = NoteDatabase()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleNotes()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //MARK: load notes
    func loadSampleNotes(){
        notes = noteDb.loadAllNotes()
//        let note1 = Note(name: "Hop nhom ngc team", content: "Hop ngctem o quan nuoc o chan cau kinh te quoc dan", time: "2016-09-19 20:00")!
//        let note2 = Note(name: "Hop nhom do an", content: "Hop nhom de lam do an", time: "2016-11-11 06:00")!
//        let note3 = Note(name: "Dealine ngc task", content: "Task cua anh Ngoc giao co dealine ngay hom nay vao 24h", time: "2016-09-26 06:00")!
//        let note4 = Note(name: "Bao cao mica", content: "Hom nay phai hoan thanh bao cao cho mica", time: "2016-09-16 08:30")!
//        let note5 = Note(name: "Hop lien chi doan", content: "Hop lien chi doan de bao cao tinh hinh hoat dong cua lien chi doan trong nam vua qua", time: "2016-10-26 09:25")!
//        let note6 = Note(name: "Hoc tieng anh", content: "Hoc tieng anh hang ngay", time: "2016-10-16 07:30")!
//        let note7 = Note(name: "Don em gai", content: "Hom nay em gai den choi, can phai don dep nha cua va di don no vao luc 18h00", time: "2016-10-16 22:30")!
//        let note8 = Note(name: "Nhau nhet", content: "Chieu toi nay co cuoc nhau voi may thang ban than, phai hoan thanh nhiem vu truoc de di nhau !! :)", time: "2016-11-16 08:50")!
//        let note9 = Note(name: "Goi dien", content: "Lau lam chua goi ve cho gia dinh, hom nay phai goi ve nha", time: "2016-11-16")!
//        let note10 = Note(name: "Lam bai tap", content: "Tieng Phap hom nay la dealine, can phai hoan thanh som", time: "2016-12-29 06:00")!
//        let note11 = Note(name: "Di hoc them tieng anh", content: "Hoc them tieng anh vao ngay mai, toi nay phai chuan bi lam bai tap ve nha", time: "2016-12-16 23:00")!
//        
//        notes += [note1, note2, note3, note4, note5, note6, note7, note8, note9, note10, note11]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "NoteTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NoteTableViewCell
        let note = notes[indexPath.row]
        let noteImageView: UIImage  = UIImage(named: "noteComponentIcon")!
        cell.noteImageView.image = noteImageView
        cell.titleLable.text = note.title
        cell.contentLable.text = note.content	
        cell.timeLable.text = note.time
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if noteBarButtonItem === sender {
        } else {
            let noteDetailViewController = segue.destinationViewController as! NoteDetailViewController
            if let selectedPlantCell = sender as? NoteTableViewCell {
                let indexPath = tableView!.indexPathForCell(selectedPlantCell)!
                let selectedNote = notes[indexPath.row]
                noteDetailViewController.note = selectedNote
            }        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
