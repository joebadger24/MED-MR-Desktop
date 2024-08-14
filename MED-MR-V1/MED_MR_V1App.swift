//
//  MED_MR_V1App.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 13/07/2024.
//

import SwiftUI

@main
struct MED_MR_V1App: App 
{
    @StateObject private var model = AppModel()
    
    var body: some Scene
    {
        WindowGroup
        {
            MainMenuView()
                .environmentObject(model)
                .frame(minWidth: 1000, minHeight: 550)
        }
        .defaultSize(width: 1400, height: 1000)
        .windowResizability(WindowResizability.contentMinSize)
        
        WindowGroup(id: "ImageCollectionWindow", for: UUID.self) { $uuid in
            
            ImageWindow(windowID: uuid!)
                .environmentObject(model)
        }
        .defaultSize(width: 500, height: 500)
        .windowResizability(WindowResizability.contentMinSize)
        
        WindowGroup(id: "SummaryAChartWindow", for: UUID.self) { $uuid in
            
            SummaryAChartWindow(chartID: uuid!)
                .environmentObject(model)
                .frame(minWidth: 600, minHeight: 600)
        }
        .defaultSize(width: 1600, height: 1000)
        .windowResizability(WindowResizability.contentMinSize)
        
        WindowGroup(id: "SummaryBChartWindow", for: UUID.self) { $uuid in
            
            SummaryBChartWindow(chartID: uuid!)
                .environmentObject(model)
                .frame(minWidth: 600, minHeight: 600)
        }
        .defaultSize(width: 1600, height: 1000)
        .windowResizability(WindowResizability.contentMinSize)
        
        WindowGroup(id: "LongNotesWindow", for: UUID.self) { $uuid in
            
            LongNotesWindow()
                .environmentObject(model)
                .frame(minWidth: 600, minHeight: 500)
        }
        .defaultSize(width: 600, height: 500)
        .windowResizability(WindowResizability.contentMinSize)
    }
}
