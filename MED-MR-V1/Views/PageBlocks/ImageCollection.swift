//
//  ImageCollection.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI

struct ImageCollection: View 
{
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var model: AppModel
    
    var pageBlockTitle: String
    var imageFileName: String
    
    var body: some View
    {
        VStack
        {
            Button(action: {
                if pageBlockTitle == "Chest X-Rays"
                {
                    openWindow(id: "ImageCollectionWindow", value: model.xrayID)
                }
                else if pageBlockTitle == "Ultrasounds"
                {
                    openWindow(id: "ImageCollectionWindow", value: model.ultraID)
                }
                else if pageBlockTitle == "Images"
                {
                    openWindow(id: "ImageCollectionWindow", value: model.imagesID)
                }
                else
                {
                    print("Error!!!")
                }
                
            }, label:
            {
                Text(pageBlockTitle)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 40)
                    .background()
                    .cornerRadius(20)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 10)
            .padding(.top, 30)
            
            Spacer()
            
            Image(imageFileName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
                .padding(.bottom, 50)
            
        }
        .frame(width: 400, height: 400)
        .background(.gray)
        .cornerRadius(20)
    }
}

#Preview 
{
    ImageCollection(pageBlockTitle: "Chest X-Ray", imageFileName: "Xray_share")
        .environmentObject(AppModel())
}
