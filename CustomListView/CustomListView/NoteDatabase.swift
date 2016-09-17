//
//  NoteDatabase.swift
//  CustomListView
//
//  Created by ComVis on 9/15/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import SQLite

class NoteDatabase{
    var conn: Connection!
    let COL_TITLE = Expression<String>("Title")
    let COL_CONTENT = Expression<String>("Content")
    let COL_TIME = Expression<String> ("Time")
    var TABLE_NOTE = Table("Note")
    
    init() {
        conn = SQLiteManagement().conn
    }
    
    func loadAllNotes() -> [Note]!{
        var notes = [Note]()
        for row in try! conn.prepare(TABLE_NOTE.order(COL_TIME)){
            let note: Note = Note(name: row[COL_TITLE], content: row[COL_CONTENT], time: row[COL_TIME])!
            notes.append(note)
        }
        return notes
    }
}



