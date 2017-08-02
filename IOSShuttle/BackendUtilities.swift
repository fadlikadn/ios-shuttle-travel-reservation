//
//  BackendUtilities.swift
//  IOSShuttle
//
//  Created by MTMAC23 on 8/1/17.
//  Copyright © 2017 MTMAC23. All rights reserved.
//

import Foundation
import UIKit
import LoopBack

class BackendUtilities {
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate!)
    let DEFAULTS_CURRENT_USER_ID_KEY: String = "LBUserRepositoryCurrentUserId"
    var adapter: LBRESTAdapter
    var clientRepo: ClientRepository
    
    static let sharedInstance = BackendUtilities()
    
    init() {
        adapter = appDelegate?.adapter as LBRESTAdapter!
        clientRepo = adapter.repository(with: ClientRepository.self) as! ClientRepository
    }
    
}
