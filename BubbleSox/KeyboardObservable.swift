//
//  KeyboardScrollable.swift
//  BubbleSox
//
//  Created by Zulwiyoza Putra on 27/10/18.
//  Copyright © 2018 Zulwiyoza Putra. All rights reserved.
//

import UIKit

protocol KeyboardObservable {
    func setKeyboardObserver() -> Void
    func keyboardWillShow(_ sender: Notification) -> Void
    func keyboardWillHide(_ sender: Notification) -> Void
}
