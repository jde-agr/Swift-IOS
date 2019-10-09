var testDeck = Deck(mixed: false)
var x: Card?

print(testDeck)

x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()

x = nil

print("")
for (i, elem) in testDeck.outs.enumerated() {
	    print("outs[\(i)] = \(elem)")
}
print("Total cards in outs: \(testDeck.outs.count)\n")
testDeck.fold(c: testDeck.outs[0])
testDeck.fold(c: testDeck.outs[1])
testDeck.fold(c: testDeck.outs[2])
testDeck.fold(c: testDeck.outs[3])

for (i, elem) in testDeck.discards.enumerated() {
	    print("discards[\(i)] = \(elem)")
}
print("Total cards in discarded: \(testDeck.discards.count)\n")
for (i, elem) in testDeck.outs.enumerated() {
	    print("outs[\(i)] = \(elem)")
}
print("Total cardds in outs: \(testDeck.outs.count)\n")
for i in testDeck.cards {
	  print(i)
}
print("Total cards in deck: \(testDeck.cards.count)")