//
//  TextView.swift
//  UIViewRepresentable
//
//  Created by 김건우 on 11/2/23.
//

import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
    
    @Binding var input: String
    
    // ⭐️ UIKit View를 생성해 반환함.
    // ⭐️ context 매개변수는 시스템(뷰)의 현재 상태에 관한 정보를 담고 있음.
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 20)
        view.backgroundColor = UIColor.systemYellow
        view.delegate = context.coordinator // ❗️
        return view
    }
    
    // ⭐️ SwiftUI에서 값의 변화가 감지되면 UIKit View를 업데이트함.
    // 'Clear' 버튼을 클릭하게 된다면 해당 함수가 호출됨.
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = input
    }
    
    func makeCoordinator() -> TextViewCoordinator {
        return TextViewCoordinator(input: $input)
    }
    
}

// ⭐️ Coordinator 클래스는 UIKit View에서 값의 변화가 감지되면 SwiftUI로 값을 되돌려주는 역할을 함.
// ⭐️ 필요한 델리게이트 메소드를 구현해 UIKit View의 동작을 구체화시킬 수 있음.
final class TextViewCoordinator: NSObject, UITextViewDelegate {
    
    @Binding var inputCoordinator: String
    
    init(input: Binding<String>) {
        self._inputCoordinator = input
    }
    
    func textViewDidChange(_ textView: UITextView) {
        inputCoordinator = textView.text
    }
    
}

