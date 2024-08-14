//
//  DataTypes.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 13/07/2024.
//

import Foundation

struct ChartData
{
    var id = UUID()
    var index: Int
    var value: Double
}

struct TabularData
{
    var id = UUID()
    var index: Int
    var value: String
}

struct LongNotesData: Identifiable
{
    var id = UUID()
    var messageSubject: String
    var messageAuthor: String
    var messageContent: String
}
