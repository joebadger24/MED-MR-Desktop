//
//  ChartWindow.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI

struct SummaryBChartWindow: View 
{
    @EnvironmentObject var model: AppModel
    
    var chartID: UUID
    
    var body: some View
    {
        VStack
        {
            Text("Joe Bloggs - Summary B")
                .padding(.top, 20)
                .font(.system(size: 36, weight: .medium))
            
            HStack
            {
                VStack
                {
                    Text("Date")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150, height: 40)
                    
                    Text("Time")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150, height: 40)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("Heart Rate")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("SpO2")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("Temp Control")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: 40)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("Central Temp")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: 40)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("Handles")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: 40)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("Belly Girth")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: 40)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("Belly App")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: 40)
                }
                .borderRight(width: 1, color: .black)
                
                ScrollViewReader { proxy in
                    
                    ScrollView(.horizontal)
                    {
                        TabularView(themeColour: .clear, data: model.dateData, isTime: true)
                            .frame(width: 5000, height: 40)
                            .id("timeTab")
                        
                        TabularView(themeColour: .clear, data: model.timeData, isTime: true)
                            .frame(width: 5000, height: 40)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        ChartView(themeColour: .red, data: model.heartRateData)
                            .frame(width: 5000)
                            .frame(maxHeight: .infinity)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        ChartView(themeColour: .blue, data: model.spo2RRData)
                            .frame(width: 5000)
                            .frame(maxHeight: .infinity)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        TabularView(themeColour: .clear, data: model.tempcontData, isTime: false)
                            .frame(width: 5000)
                            .frame(maxHeight: 40)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        TabularView(themeColour: .clear, data: model.tempcentData, isTime: false)
                            .frame(width: 5000)
                            .frame(maxHeight: 40)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        TabularView(themeColour: .clear, data: model.handlesData, isTime: false)
                            .frame(width: 5000)
                            .frame(maxHeight: 40)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        TabularView(themeColour: .clear, data: model.bellygrith, isTime: false)
                            .frame(width: 5000)
                            .frame(maxHeight: 40)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        TabularView(themeColour: .clear, data: model.bellyappData, isTime: false)
                            .frame(width: 5000)
                            .frame(maxHeight: 40)
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            proxy.scrollTo("timeTab", anchor: .trailing)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
}

#Preview(windowStyle: .automatic)
{
    SummaryBChartWindow(chartID: UUID())
        .environmentObject(AppModel())
}
