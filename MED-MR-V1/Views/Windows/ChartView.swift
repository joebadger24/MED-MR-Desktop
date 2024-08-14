//
//  ChartView.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI
import Charts

struct ChartView: View 
{
    var themeColour: Color
    var data: [ChartData]
    //var averageValue: Double
    
    var lowerRange: Double {
        data.map {$0.value}.min() ?? 0
    }
    var higherRange: Double {
        data.map {$0.value}.max() ?? 0
    }
    
    var body: some View
    {
        let xMax = Double(data.last!.index) + 0.5
        
        Chart
        {
            ForEach(data, id: \.id) { item in
                LineMark(
                x: .value("Time", item.index),
                y: .value("Count", item.value)
                )
                .symbol {
                    Circle()
                        .frame(width: 1, height: 1)
                }
            }
        }
        .foregroundColor(themeColour)
        .chartYScale(domain: (lowerRange*0.8)...(higherRange*1.2))
        .chartXScale(domain: 0.5...xMax)
        .chartXAxis(Visibility.hidden)
    }
}

