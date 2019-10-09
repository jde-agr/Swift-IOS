import Foundation //In order to make use of NSObject

class Card: NSObject {
    var colour: Color
    var value: Value
    
    init(Color colour: Color, Value value: Value) { //Argument_label parameter_name: Type
        self.colour = colour
        self.value = value
    }

    override var description: String {
        return "\(self.value) of \(self.colour)"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            return (self.colour == object.colour && self.value == object.value)
        }
        return (false)
    }
}

func ==(first: Card, second: Card) -> Bool {
    return (first.colour == second.colour && first.value == second.value)
}