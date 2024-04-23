import Foundation
import Combine

@propertyWrapper
final class Observable<Value> {
    private var value: Value
    private var subject = PassthroughSubject<Value, Never>()
    
    var wrappedValue: Value {
        get { value }
        set {
            value = newValue
            subject.send(newValue)
        }
    }
    
    var projectedValue: AnyPublisher <Value, Never>  {
        subject.eraseToAnyPublisher()
    }
    
    init(wrappedValue: Value) {
        value = wrappedValue
    }
}
