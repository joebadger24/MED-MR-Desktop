//
//  ContentView.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 13/07/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MainMenuView: View
{
    @EnvironmentObject var model: AppModel
    
    let itemSize: CGFloat = 440
    let itemSpacing: CGFloat = 40
    
    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                HeaderBarView()
                
                GeometryReader { geometry in
                    
                    let columns: [GridItem] = Array(repeating: .init(.fixed(itemSize)), count: Int(geometry.size.width / itemSize))
                    
                    ScrollView(.vertical)
                    {
                        LazyVGrid(columns: columns, spacing: itemSpacing)
                        {
                            PatientSummary()
                            
                            PatientTimeline()
                            
                            NursingChart()
                                .environmentObject(model)
                            
                            LongNotes()
                                .environmentObject(model)
                            
                            ImageCollection(pageBlockTitle: "Chest X-Rays", imageFileName: "Xray_share")
                                .environmentObject(model)
                            
                            ImageCollection(pageBlockTitle: "Ultrasounds", imageFileName: "ultrasound2")
                                .environmentObject(model)
                            
                            ImageCollection(pageBlockTitle: "Images", imageFileName: "babyCot")
                                .environmentObject(model)
                        }
                        .padding(.vertical, 30)
                        .padding(.horizontal, 30)
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
    }
}

#Preview(windowStyle: .automatic) 
{
    MainMenuView()
        .environmentObject(AppModel())
}
