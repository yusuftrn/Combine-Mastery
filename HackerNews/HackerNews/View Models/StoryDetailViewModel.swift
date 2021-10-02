import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
  
  private var cancellable: AnyCancellable?
  @Published private var story = Story.placeholder()
  
  func fetchStoryDetails(storyId: Int) {
    print("about to make a network request")
    self.cancellable = Webservice().getStoryById(storyId: storyId)
      .catch { _ in Just(Story.placeholder()) }
      .sink(receiveCompletion: { _ in }, receiveValue: { story in
        self.story = story
      })
  }
}

extension StoryDetailViewModel {
  var title: String {
    return self.story.title
  }
  var url: String {
    return self.story.url
  }
}
