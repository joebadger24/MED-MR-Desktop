//
//  LongNotesWindow.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 10/08/2024.
//

import SwiftUI

struct LongNotesWindow: View 
{
    @EnvironmentObject var model: AppModel
    @State private var selectedMessageID: UUID?
    var addMessageID = UUID()
    
    var body: some View
    {
        HStack
        {
            VStack
            {
                Text("Joe Bloggs")
                    .font(.system(size: 30, weight: .medium))
                
                Text("Detailed Notes")
                    .font(.system(size: 20, weight: .medium))
                
                List(selection: $selectedMessageID)
                {
                    ForEach(model.LongNotesList) { message in
                        Text(message.messageSubject)
                            .tag(message.id)
                    }
                    
                    Text("+ Add Note")
                        .tag(addMessageID)
                }
                .padding(.top, 10)
            }
            .borderRight(width: 3, color: .white)
            .padding(.vertical, 20)
            .frame(maxWidth: 300)
            
            if selectedMessageID == addMessageID {
                AddMessageForm(selectedMessageID: $selectedMessageID)
                    .environmentObject(model)
                    .frame(maxWidth: .infinity)
            }
            else if let selectedMessageID = selectedMessageID,
                let selectedMessage = model.LongNotesList.first(where: { $0.id == selectedMessageID }) 
            {
                LongMessageDetail(message: selectedMessage)
                    .frame(maxWidth: .infinity)
            }
            else
            {
                Text("Select a note to view full information")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview (windowStyle: .automatic)
{
    LongNotesWindow()
        .environmentObject(AppModel())
}

struct AddMessageForm: View 
{
    @EnvironmentObject var model: AppModel
    @State private var messageSubject: String = ""
    @State private var messageContent: String = ""
    @Binding var selectedMessageID: UUID?
    
    func submitMessage(subject: String, message: String)
    {
        let author = "Username - 11:56 07/07"
        let newLongNote = LongNotesData(messageSubject: subject, messageAuthor: author, messageContent: message)
        
        model.LongNotesList.append(newLongNote)
        selectedMessageID = newLongNote.id
        messageSubject = ""
        messageContent = ""
        
        print("Clicked")
    }
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                TextField("Subject", text: $messageSubject)
                    .font(.system(size: 24))
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                
                Button(action: {
                    submitMessage(subject: messageSubject, message: messageContent)
                }, label:
                {
                    Text("Submit")
                        .frame(width: 100, height: 30)
                        .background(.blue)
                        .cornerRadius(20)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 20)
            }
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .padding(.vertical, 5)
            
            TextEditor(text: $messageContent)
                .frame(maxHeight: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
            
            Spacer()
            
            HStack
            {
                Spacer()
            }
        }
        .padding(20)
    }
}

struct LongMessageDetail: View 
{
    var message: LongNotesData
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text(message.messageSubject)
                .font(.system(size: 24))
                .padding(.top, 10)
                .padding(.bottom, 5)
            
            Text(message.messageAuthor)
                .font(.system(size: 16))
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .padding(.vertical, 5)
            
            Text(message.messageContent)
            
            Spacer()
            
            HStack
            {
                Spacer()
            }
        }
        .padding(20)
    }
}
