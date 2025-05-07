import SwiftUI

class LeakyClass {
  var bruh: (() -> Void)?
  let value: Int

  init(value: Int) {
    self.value = value
    bruh = {
      self.doSomething()
    }
  }

  func doSomething() {
    print("Doing something...")
  }

  deinit {
    print("LeakyClass deinitialized")
  }
}

struct ContentView: View {
  @State private var isDetailViewShowing = false

  var body: some View {
    VStack {
      Button("Go to Detail View") {
        isDetailViewShowing = true
      }
      .sheet(isPresented: $isDetailViewShowing, content: {
        DetailView(leakyClass: LeakyClass(value: Int.random(in: 0..<1000)))
      })
    }
  }
}

struct DetailView: View {
  let leakyClass: LeakyClass

  var body: some View {
    Text("Detail View: \(leakyClass.value)")
      .onDisappear {
        leakyClass.handler?()
      }
  }
}
