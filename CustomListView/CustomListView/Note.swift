//
//  Note.swift
//  CustomListView
//
//  Created by ComVis on 9/14/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import UIKit

class Note {
    var title: String
    var content: String
    var time: String
    
    init? (name: String, content: String, time: String){
        self.title = name
        self.content = content
        self.time = time
        
        if name.isEmpty || time.isEmpty || content.isEmpty {
            return nil
        }
    }
}