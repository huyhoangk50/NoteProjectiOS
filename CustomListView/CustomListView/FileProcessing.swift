//
//  FileProcessing.swift
//  CustomListView
//
//  Created by ComVis on 9/15/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import UIKit

class FileProcessing: NSObject {
    // Get path of specified file
    class func getPath(fileName: String) -> String {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documentsURL.URLByAppendingPathComponent(fileName)
        return fileURL.path!
    }
    
    // Copy file from source to destination
    class func copyFile(fileName: String) {
        let dstPath: String = getPath(fileName)
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(dstPath) {
            let documentsURL = NSBundle.mainBundle().resourcePath
            let fromPath = documentsURL! + "/" + fileName
//            let testFromPath = NSBundle.mainBundle().pathForResource("CayThuocVN", ofType: "db")
//            print(testFromPath)
//            if !fileManager.fileExistsAtPath(fromPath){
//                print(fromPath)
//            }
//            print(dstPath)
            try! fileManager.copyItemAtPath(fromPath, toPath: dstPath)
        }
    }
    
//    class func copyAllImage() {
//        let fileManager = NSFileManager.defaultManager()
//        let path = NSBundle.mainBundle().resourcePath!
//        let items = try! fileManager.contentsOfDirectoryAtPath(path)
//        
//        for item in items {
//            if item.hasSuffix(".jpg") || item.hasSuffix(".JPG"){
//                copyFile(item)
//            }
//        }
//    }
    // Save picked image
//    class func saveImage(image: UIImage, path: String) -> Bool{
//        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)
//        let result = jpgImageData?.writeToFile(path, atomically: true)
//        return result!
//    }
    
    //read file from memory
    class func readFile(fileName: String)->String?{
        
        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(fileName)
            do {
                let contents = try NSString(contentsOfURL: path, encoding: NSUTF8StringEncoding) as String
                return contents
                
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    //write file to memory
    class func writeToFile(fileName: String, contents: String){
        let file = fileName //this is the file. we will write to and read from it
        
        let text = contents //just a text
        
        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
            
            //writing
            do {
                try text.writeToURL(path, atomically: true, encoding: NSUTF8StringEncoding)
            }
                
            catch {/* error handling here */}
        }
    }
    //read file from bundle
    class func readFileFromBundle(fileName : String) -> String{
        let records = fileName.componentsSeparatedByString(".")
        var contents = ""
        var headFilename = ""
        for i in 0..<(records.count - 1 ){
            if(i>0){
                headFilename = headFilename + "." + records[i]
            } else{
                headFilename = headFilename + records[i]
            }
            
        }
        
        
        if let filepath = NSBundle.mainBundle().pathForResource(headFilename, ofType: records[records.count - 1]) {
            do {
                contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                //                print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        return contents;
    }
}