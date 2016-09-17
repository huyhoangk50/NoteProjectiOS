//
//  SQLiteManagement.swift
//  CustomListView
//
//  Created by ComVis on 9/15/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import SQLite

class SQLiteManagement{
    var conn: Connection
    init() {
        conn = try! Connection(FileProcessing.getPath("Note.db3"))
    }
}
