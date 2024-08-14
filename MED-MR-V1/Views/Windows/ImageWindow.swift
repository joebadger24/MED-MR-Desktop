//
//  ImageWindow.swift
//  MED-MR-V1
//
//  Created by Joe Badger on 14/07/2024.
//

import SwiftUI

struct ImageWindow: View 
{
    @EnvironmentObject var model: AppModel
    
    var windowID: UUID
    
    var body: some View
    {
        VStack
        {
            let windowTitle = windowID == model.xrayID ? "Chest X-Rays" : (windowID == model.imagesID ? "Images" : (windowID == model.ultraID ? "Ultrasounds" : "Error"))
            
            let numImg = windowID == model.xrayID ? 4 : (windowID == model.imagesID ? 6 : (windowID == model.ultraID ? 2 : 1))
            
            let imageString = windowID == model.xrayID ? "Xray_share" : (windowID == model.imagesID ? "babyCot" : (windowID == model.ultraID ? "ultrasound" : "Error"))
            
            Text(windowTitle)
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
                .padding(.bottom, 10)

            HStack
            {
                VStack
                {
                    HStack
                    {
                        Text("Patient:")
                        
                        Spacer()
                        
                        VStack(alignment: .trailing)
                        {
                           Text("Joe Bloggs")
                        }
                    }
                    
                    HStack
                    {
                        Text("Available:")
                        
                        Spacer()
                        
                        VStack(alignment: .trailing)
                        {
                            Text(numImg.description)
                        }
                    }
                }
                .padding(.leading, 50)
                .padding(.trailing, 25)
                
                VStack
                {
                    HStack
                    {
                        Text("Ward Number:")
                        
                        Spacer()
                        
                        VStack(alignment: .trailing)
                        {
                           Text("1")
                        }
                    }
                    
                    HStack
                    {
                        Text("Cot Number:")
                        
                        Spacer()
                        
                        VStack(alignment: .trailing)
                        {
                           Text("4")
                        }
                    }
                }
                .padding(.leading, 25)
                .padding(.trailing, 50)
            }
            .frame(width: 500)
            
            TabView
            {
                ForEach(0..<numImg, id: \.self) { index in
                    
                    VStack
                    {
                        Text("0\(index + 1) July 2024")
                            .font(.system(size: 24, weight: .medium))
                        
                        Image(imageString)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .overlay
                            {
                                Text("Image \(index + 1)")
                                    .font(.system(size: 50, weight: .bold))
                            }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .padding(20)
            
            Spacer()
 
        }
        //.frame(width: 500, height: 500)
    }
}

#Preview(windowStyle: .automatic)
{
    ImageWindow(windowID: AppModel().xrayID)
        .environmentObject(AppModel())
}

