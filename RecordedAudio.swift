//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Mike on 12/25/15.
//  Copyright © 2015 Mike. All rights reserved.
//

import Foundation

class RecordedAudio {
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}