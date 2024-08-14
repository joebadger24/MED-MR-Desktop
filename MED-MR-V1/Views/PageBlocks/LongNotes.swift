//
//  LongNotes.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 10/08/2024.
//

import SwiftUI

struct LongNotes: View 
{
    @EnvironmentObject var model: AppModel
    @Environment(\.openWindow) private var openWindow
    
    let usableID = UUID()
    
    var body: some View
    {
        VStack
        {
            Text("Detailed Notes")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            VStack
            {
                ForEach(model.LongNotesList) { message in
                    LongNotesTitle(messageSubject: message.messageSubject, messageAuthor: message.messageAuthor)
                }
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Button(action: {
                    openWindow(id: "LongNotesWindow", value: usableID)
                }, label:
                {
                    Text("View Detailed Notes")
                        .frame(width: 200, height: 30)
                        .background(.blue)
                        .cornerRadius(20)
                })
                .buttonStyle(PlainButtonStyle())
                
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
    LongNotes()
        .environmentObject(AppModel())
}

struct LongNotesTitle: View 
{
    var messageSubject: String
    var messageAuthor: String
    
    var body: some View
    {
        VStack
         {
             Rectangle()
                 .frame(height: 2)
                 .foregroundColor(.white)
             
             HStack
             {
                 Text("📝")
                     .font(.system(size: 34))
                     .padding(.trailing, 10)
                 
                 VStack(alignment: .leading)
                 {
                     Text(messageSubject)
                         .font(.system(size: 20, weight: .bold))
                     
                     Text(messageAuthor)
                 }
                 
                 Spacer()
                 
                 
             }
         }
         .padding(.bottom, 8)
    }
}
