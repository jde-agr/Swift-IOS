var colours: [Color] = Color.allColors
var values: [Value] = Value.allValues

for elem in colours {
    print("\(elem) = \(elem.rawValue)") //String interpolation done using \() in swift
}

for elem in values {
    print("\(elem) = \(elem.rawValue)")
}