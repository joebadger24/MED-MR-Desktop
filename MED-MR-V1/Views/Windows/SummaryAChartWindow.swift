//
//  SummaryAChartWindow.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 09/08/2024.
//

import SwiftUI

struct SummaryAChartWindow: View 
{
    @EnvironmentObject var model: AppModel
    
    var chartID: UUID
    
    var body: some View
    {
        VStack
        {
            Text("Joe Bloggs - Summary A")
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
                    
                    Text("SpO2, RR")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("SPO2 (dual)")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("BP (Art)")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

                    
                    Rectangle()
                        .frame(width: 150, height: 1)
                        .padding(.horizontal, 10)
                        .foregroundColor(.black)
                    
                    Text("BP (NI)")
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
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
                        
                        ChartView(themeColour: .green, data: model.spo2dualData)
                            .frame(width: 5000)
                            .frame(maxHeight: .infinity)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        ChartView(themeColour: .purple, data: model.bpartData)
                            .frame(width: 5000)
                            .frame(maxHeight: .infinity)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                        
                        ChartView(themeColour: .cyan, data: model.bpniData)
                            .frame(width: 5000)
                            .frame(maxHeight: .infinity)
                        
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
    SummaryAChartWindow(chartID: UUID())
        .environmentObject(AppModel())
}
