//
//  PatientSummary.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 13/07/2024.
//

import SwiftUI

struct PatientSummary: View 
{
    var body: some View 
    {
        VStack
        {
            summaryKeyValue(keyString: "Cot No.", valueString: "4")
            summaryKeyValue(keyString: "Name", valueString: "Joe Bloggs")
            summaryKeyValue(keyString: "DOB", valueString: "24/01/2024")
            summaryKeyValue(keyString: "Weight (Birth)", valueString: "4.21 lb")
            summaryKeyValue(keyString: "Weight (Now)", valueString: "5.13 lb")
            summaryKeyValue(keyString: "Gestation", valueString: "24")
            summaryKeyValue(keyString: "Consultant", valueString: "Jane Doe")
            summaryKeyValue(keyString: "Nurse", valueString: "John Smith")
            summaryKeyCircle(keyString: "Allergies", circleColour: .green)
            summaryKeyCircle(keyString: "Social Care", circleColour: .blue)
            summaryKeyCircle(keyString: "Infection Risk", circleColour: .red)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .frame(width: 400, height: 400)
        .background(.gray)
        .cornerRadius(20)
    }
}

#Preview
{
    PatientSummary()
}


struct summaryKeyValue: View 
{
    var keyString: String
    var valueString: String
    
    var body: some View
    {
        HStack
        {
            Text(keyString)
                .font(.system(size: 20))
            
            Spacer()
            
            VStack(alignment: .trailing)
            {
                Text(valueString)
                    .font(.system(size: 20, weight: .medium))
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct summaryKeyCircle: View
{
    var keyString: String
    var circleColour: Color
    
    var body: some View
    {
        HStack
        {
            Text(keyString)
                .font(.system(size: 20))
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(circleColour)
        }
        .frame(maxHeight: .infinity)
    }
}



