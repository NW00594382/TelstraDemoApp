//
//  ViewControllerVM.swift
//  TelestraDemoApp
//
//  Created by Nikhil Wagh on 18/04/20.
//  Copyright © 2020 Tech Mahindra. All rights reserved.
//

import Foundation

struct ViewControllerVM {
    
    var dataModel: DataModel
    var rowsArray : [Row]  = [Row]()
    var screenTitle: String
    
    init(dataModel: DataModel) {
        self.dataModel = dataModel
        self.screenTitle = self.dataModel.title
        self.rowsArray = self.dataModel.rows.filter{ $0.title != nil }
    }
}