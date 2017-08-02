//
//  ClientRepository.swift
//  IOSShuttle
//
//  Created by MTMAC23 on 8/1/17.
//  Copyright © 2017 MTMAC23. All rights reserved.
//

import UIKit
import LoopBack

class ClientRepository: LBUserRepository {
    override init!(className name: String!) {
        super.init(className: "Clients")
    }
    override init() {
        super.init(className: "Clients")
    }
}

class Client: LBUser {
    
}
