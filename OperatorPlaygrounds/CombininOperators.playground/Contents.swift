import Combine
import Foundation

//prepend
func prependExample() {
  let nums = (1...5).publisher
  let others = (6...10).publisher
  
  nums
    .prepend(others)
    .collect()
    .sink { print($0) }
}


//switchToLatest
func switchToLatestExample() {
  let publisher1 = PassthroughSubject<String, Never>()
  let publisher2 = PassthroughSubject<String, Never>()
  let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
  
  publishers
    .switchToLatest()
    .sink { print($0) }
  
  publishers.send(publisher1)
  
  publisher1.send("Publisher 1 - Value 1")
  publisher2.send("Publisher 2 - Value 0")
  publisher1.send("Publisher 1 - Value 2")
  
  publishers.send(publisher2)
  
  publisher2.send("Publisher 2 - Value 3")
  publisher1.send("Publisher 1 - Value 4")
  publisher2.send("Publisher 2 - Value 5")
}

// merge
func mergeExample() {
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<Int, Never>()
  
  publisher1
    .merge(with: publisher2)
    .sink { print($0) }
  
  publisher1.send(10)
  publisher1.send(11)
  
  publisher2.send(13)
  publisher2.send(14)
}

//combineLatest
func combineLatestExample() {
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<String, Never>()
  
  publisher1
    .combineLatest(publisher2)
    .sink { print("P1: \($0), P2: \($1)")}
  
  publisher1.send(1)
  publisher2.send("A")
  publisher2.send("B")
}

//combineLatest2
func combineLatestExample2() {
  let pub1 = PassthroughSubject<Int, Never>()
  let pub2 = PassthroughSubject<Int, Never>()
  
  let cancellable = pub1
    .combineLatest(pub2)
    .sink { print("Result: \($0).") }
  
  pub1.send(1)
  pub1.send(2)
  pub2.send(2)
  pub1.send(3)
  pub1.send(45)
  pub2.send(22)
  
    // Prints:
    //    Result: (2, 2).    // pub1 latest = 2, pub2 latest = 2
    //    Result: (3, 2).    // pub1 latest = 3, pub2 latest = 2
    //    Result: (45, 2).   // pub1 latest = 45, pub2 latest = 2
    //    Result: (45, 22).  // pub1 latest = 45, pub2 latest = 22
}

//zip
func zipExample() {
  let numbersPub = PassthroughSubject<Int, Never>()
  let lettersPub = PassthroughSubject<String, Never>()
  let emojiPub = PassthroughSubject<String, Never>()
  
  _ = numbersPub
    .zip(lettersPub, emojiPub)
    .sink { print("\($0)") }
  
  numbersPub.send(1)     // numbersPub: 1      lettersPub:          emojiPub:        zip output: <none>
  numbersPub.send(2)     // numbersPub: 1,2    lettersPub:          emojiPub:        zip output: <none>
  numbersPub.send(3)     // numbersPub: 1,2,3  lettersPub:          emojiPub:        zip output: <none>
  lettersPub.send("A")   // numbersPub: 1,2,3  lettersPub: "A"      emojiPub:        zip output: <none>
  emojiPub.send("😀")    // numbersPub: 2,3    lettersPub: "A"      emojiPub: "😀"   zip output: (1, "A", "😀")
  lettersPub.send("B")   // numbersPub: 2,3    lettersPub: "B"      emojiPub:        zip output: <none>
  emojiPub.send("🥰")    // numbersPub: 3      lettersPub:          emojiPub:        zip output: (2, "B", "🥰")
  
}
zipExample()

