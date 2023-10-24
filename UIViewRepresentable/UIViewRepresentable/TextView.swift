//
//  TextView.swift
//  UIViewRepresentable
//
//  Created by 김건우 on 10/24/23.
//

import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
    
    @Binding var input: String
    
    // ⭐️ UIKit View를 생성해 반환함.
    // ⭐️ context 매개변수는 시스템(뷰)의 현재 상태에 관한 정보를 담고 있음.
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = UIColor.systemYellow
        view.font = UIFont.systemFont(ofSize: 17)
        view.delegate = context.coordinator // ❗️
        return view
    }
    
    // ⭐️ SwiftUI에서 값의 변화가 발생하면 UIKit을 업데이트함.
    // 'Clear' 버튼을 클릭하게 된다면 해당 함수가 호출됨.
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = input
    }
    
    func makeCoordinator() -> CoordinatorTextView {
        return CoordinatorTextView(input: $input)
    }
    
}

// ⭐️ Coordinator 클래스는 UIKit에서 값의 변화가 발생하면 SwiftUI로 값을 되돌려주는 역할을 함.
// ⭐️ 필요한 델리게이트 메소드를 구현해 View의 동작을 구체화시킬 수 있음.
final class CoordinatorTextView: NSObject, UITextViewDelegate {
    
    @Binding var inputCoordinator: String
    
    init(input: Binding<String>) {
        self._inputCoordinator = input
    }
    
    // TextView에 입력을 하면 해당 메서드가 호출됨.
    func textViewDidChange(_ textView: UITextView) {
        inputCoordinator = textView.text
    }
    
}

