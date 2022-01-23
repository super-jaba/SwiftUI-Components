//
//  CustomTextField.swift
//  Components
//
//  Created by Павел Кононов on 23.01.2022.
//

import SwiftUI

struct CustomTextField: View {
    
    let placeholder: String
    @Binding var text: String
    let sfSymbol: String?
    let cornerRadius: CGFloat
    let borderColor: Color
    
    private let textFieldLeadingPadding: CGFloat = 30
    
    init(
        _ placeholder: String,
        text: Binding<String>,
        sfSymbol: String? = nil,
        cornerRadius: CGFloat = 10,
        borderColor: Color = .gray.opacity(0.5)
    ) {
        self.placeholder = placeholder
        self._text = text
        self.sfSymbol = sfSymbol
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(placeholder, text: $text)
                .padding(
                    .leading,
                    sfSymbol == nil ? textFieldLeadingPadding / 2 : textFieldLeadingPadding
                )
            
            if let icon = sfSymbol {
                Image(systemName: icon)
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(.leading, 5)
            }
            
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(borderColor)
        }
        .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTextField(
                "Email",
                text: .constant(""),
                sfSymbol: "envelope"
            )
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Email TF")
        }
    }
}
