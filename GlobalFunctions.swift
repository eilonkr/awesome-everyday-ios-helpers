
import UIKit

// MARK: - GCD Helpers

func delay(_ interval: TimeInterval, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        closure()
    }
}

func asyncMain(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async(execute: closure)
}

func asyncGlobal(qos: DispatchQoS.QoSClass = .default, _ closure: @escaping () -> Void) {
    DispatchQueue.global(qos: qos).async(execute: closure)
}

// MARK: - UI

func animated(_ duration: TimeInterval = 0.2, _ block: @escaping () -> Void) {
    UIView.animate(withDuration: duration, animations: block)
}

