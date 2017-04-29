//
//  User.swift
//  justorderstore
//
//  Created by RayRainier on 4/28/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

enum Type {
    case Client
    case Admin
    
    init() {
        self = .Client
    }
}

struct User {
    var userid: String
    var sessionid: String
    var type: Type
}
