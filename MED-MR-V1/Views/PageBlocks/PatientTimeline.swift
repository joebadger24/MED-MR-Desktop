//
//  MoreInfo.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI

struct PatientTimeline: View 
{
    var body: some View 
    {
        VStack
        {
            Text("Patient Timeline")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .padding(.horizontal, 20)
            
            timeLineStack(textString: "Born at Hospital X at 12:45 24/01/2024", emojiString: "🍼")
            
            timeLineStack(textString: "Trasfered by team Y to Unit Z at 12:56 24/01/2024", emojiString: "🚑")
            
            timeLineStack(textString: "Today is Day 5 of care in Ward Q", emojiString: "⏱️")
            
            Spacer()
        }
        .frame(width: 400, height: 400)
        .background(.gray)
        .cornerRadius(20)
    }
}

#Preview 
{
    PatientTimeline()
}

struct timeLineStack: View 
{
    var textString: String
    var emojiString: String
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(emojiString)
                    .font(.system(size: 35))
                    .frame(width: 40, height: 40)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                Text(textString)
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .padding(.horizontal, 20)
        }
        
    }
}
