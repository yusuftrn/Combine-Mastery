import Combine
import Foundation

  //filter
func filterExample() {
  let cancellable = (1...20).publisher
  
  cancellable
    .filter { $0 % 2 == 0 }
    .sink {
      print($0)
    }
}

  //filter2
func filterExample2() {
  var subscriptions = Set<AnyCancellable>()
  
  let cities = [ "Toronto", "New York", "Paris", "Rome", "Sydney", "London", "Moscow"
  ]
  
  let citiesPublisher = cities.publisher
  
  citiesPublisher
    .filter { $0.lowercased().contains("o") }
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

  //removeDuplicates
func removeDuplicatesExample() {
  var subscriptions = Set<AnyCancellable>()
  
  let values = [1, 1, 2, 3, 4, 8, 9, 9, 10]
  
  let valuesPublisher = values.publisher
  
  valuesPublisher
    .removeDuplicates()
    .sink(receiveValue: { print ($0)})
    .store(in: &subscriptions)
}


  //compactMap
func compactMapExample() {
  let values = ["a", "1.24", "b", "3.14", "c23", "6.7"]
  let cancellable = values.publisher
  
  cancellable
    .compactMap { Float($0) }
    .sink {
      print($0)
    }
}

  //ignoreOutput
func ignoreOutputExample() {
  let numbers = (1...5000).publisher
  
  numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print($0) }) { print($0) }
}

  //first(where: )
func firstExample() {
  let numbers = (1...10).publisher
  
  numbers
    .first(where: { $0 % 2 == 0})
    .sink { print($0) }
}

  // dropFirst
func dropExamples() {
  let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].publisher
  
  numbers
    .dropFirst(3)
    .collect()
    .sink { print($0) }
}

  //drop(while)
func dropWhileExample() {
  var subscriptions = Set<AnyCancellable>()
  
  let strings = ["lorem", "ipsum", "Dolor", "Sit", "amet"]
  
  let stringsPublisher = strings.publisher
  
  stringsPublisher
    .drop(while: { $0.count > 3 })
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}


//drop(untilOutputFrom)
func dropUntilOutputExample() {
  let isReady = PassthroughSubject<Void, Never>()
  let taps = PassthroughSubject<Int, Never>()
  
  taps
    .drop(untilOutputFrom: isReady)
    .sink { print($0) }
  
  (1...10).forEach { n in
    taps.send(n)
    
    if n == 3 {
      isReady.send()
    }
  }
}


//prefix
func prefixExample() {
  let cancellable = (0...10).publisher
  cancellable
    .prefix(2)
    .sink { print("\($0)", terminator: " ") }
}
prefixExample()
