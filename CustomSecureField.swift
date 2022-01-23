//
//  CustomSecureField.swift
//  Components
//
//  Created by Павел Кононов on 23.01.2022.
//

import SwiftUI

struct CustomSecureField: View {
    
    let placeholder: String
    @Binding var text: String
    let sfSymbol: String?
    let cornerRadius: CGFloat
    let borderColor: Color
    let showable: Bool
    
    @State private var showInput: Bool = false
    private let textFieldLeadingPadding: CGFloat = 30
    
    init(
        _ placeholder: String,
        text: Binding<String>,
        sfSymbol: String? = nil,
        cornerRadius: CGFloat = 10,
        borderColor: Color = .gray.opacity(0.5),
        showable: Bool = false
    ) {
        self.placeholder = placeholder
        self._text = text
        self.sfSymbol = sfSymbol
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.showable = showable
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Group {
                if showInput {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
            }
            .padding(
                .leading,
                sfSymbol == nil ? textFieldLeadingPadding / 2 : textFieldLeadingPadding
            )
            
            HStack {
                if let icon = sfSymbol {
                    Image(systemName: icon)
                        .foregroundColor(.gray.opacity(0.5))
                }
                
                Spacer()
                
                if showable {
                    Button {
                        showInput.toggle()
                    } label: {
                        Image(systemName: showInput ? "eye.slash" : "eye")
                            .foregroundColor(.gray.opacity(0.5))
                    }
                }
            }
            .padding(.horizontal, 5)
            
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(borderColor)
        }
        .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(
            "Password",
            text: .constant(""),
            sfSymbol: "lock",
            showable: true
        )
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Secure TF")
    }
}
