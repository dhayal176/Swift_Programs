//
//  Petition.swift
//  Project 7-Petitions
//
//  Created by Dhayaalan Raju on 25/06/20.
//  Copyright © 2020 Dhayaalan Raju. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
