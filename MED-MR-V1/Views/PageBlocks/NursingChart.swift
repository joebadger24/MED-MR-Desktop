//
//  NursingChart.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI

struct NursingChart: View 
{
    @EnvironmentObject var model: AppModel
    
    var body: some View
    {
        VStack
        {
            Text("Nursing Charts")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            VStack
            {
                ChartNameView(chartName: "Summary A", chartID: model.SummaryAchartID, lastUpdate: "12:07 06/07", windowID: "SummaryAChartWindow")
                
                ChartNameView(chartName: "Summary B", chartID: model.SummaryBchartID, lastUpdate: "12:09 06/07", windowID: "SummaryBChartWindow")
                
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            
        }
        .frame(width: 400, height: 400)
        .background(.gray)
        .cornerRadius(20)
    }
}

#Preview 
{
    NursingChart()
        .environmentObject(AppModel())
}

struct ChartNameView: View 
{
    @Environment(\.openWindow) private var openWindow
    var chartName: String
    var chartID: UUID
    var lastUpdate: String
    var windowID: String
    
    var body: some View
    {
       VStack
        {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.white)
                .padding(.bottom, 5)
            
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text(chartName)
                        .font(.system(size: 20, weight: .bold))
                    
                    Text("Last Updated: \(lastUpdate)")
                }
                
                Spacer()
                
                Button(action: {
                    openWindow(id: windowID, value: chartID)
                }, label:
                {
                    Text("View")
                        .frame(width: 100, height: 30)
                        .background(.blue)
                        .cornerRadius(20)
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.bottom, 5)
    }
}


