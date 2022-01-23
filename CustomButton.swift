//
//  CustomButton.swift
//  Components
//
//  Created by Павел Кононов on 23.01.2022.
//

import SwiftUI

struct CustomButton: View {
    
    let label: String
    let foreground: Color
    let background: Color
    let border: Color
    let cornerRadius: CGFloat
    
    let handler: () -> Void
    
    init(
        _ label: String,
        foreground: Color = .white,
        background: Color = .accentColor,
        border: Color = .clear,
        cornerRadius: CGFloat = 10,
        handler: @escaping () -> Void
    ) {
        self.label = label
        self.foreground = foreground
        self.background = background
        self.border = border
        self.cornerRadius = cornerRadius
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler) {
            Text(label)
                .fontWeight(.semibold)
                .foregroundColor(foreground)
        }
        .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
        .background(background)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomButton(
                "Click me!",
                background: .black
            ) {
                print("Click!")
            }
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Primary Black")
            
            CustomButton(
                "Click me!",
                foreground: .black,
                background: .clear,
                border: .black
            ) {
                print("Click!")
            }
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Secondary Black")
        }
    }
}
