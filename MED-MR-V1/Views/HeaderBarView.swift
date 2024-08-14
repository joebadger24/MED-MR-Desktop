//
//  HeaderBarView.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 13/07/2024.
//

import SwiftUI

struct HeaderBarView: View 
{
    var body: some View 
    {
        HStack
        {
            Text("MED-MR-Desktop")
                .font(.system(size: 36, weight: .medium))
                .padding(.leading, 40)
            
            Spacer()
            
            HStack
            {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipped()
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading)
                {
                    Text("User Name")
                        .font(.system(size: 25))
                    
                    Text("Doctor")
                        .font(.system(size: 20))
                }
                .padding(.trailing, 10)
            }
            .padding(.trailing, 40)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(.gray)
        .borderBottom(width: 2, color: .black)
    }
}

#Preview 
{
    HeaderBarView()
}
