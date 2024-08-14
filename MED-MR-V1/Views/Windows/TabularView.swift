//
//  TabularView.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI
import Charts

struct TabularView: View
{
    var themeColour: Color
    var data: [TabularData]
    var isTime: Bool
    
    var body: some View
    {
        let xMax = Double(data.last!.index) + 0.5
        
        Chart
        {
            ForEach(data, id: \.id) { item in
                LineMark(
                x: .value("Time", item.index),
                y: .value("Count", 0)
                )
                .symbol {
                    Circle()
                        .frame(width: 1, height: 1)
                        .overlay {
                            if isTime
                            {
                                Text(item.value)
                                    .frame(width: 100)
                                    .font(.system(size: 24, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            else
                            {
                                Text(item.value)
                                    .frame(width: 100)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.white)
                            }
                        }
                }
            }
        }
        .foregroundColor(themeColour)
        .chartXScale(domain: 0.5...xMax)
        .chartYAxis(Visibility.hidden)
        .chartXAxis(Visibility.hidden)
    }
}

