import UIKit

class TripleButton: UIButton {

  struct State {
    let title: String
    let image: UIImage
  }

  let states: [State]
  var selectedIndex: Int = 0

  // MARK: - Initialization

  init(states: [State]) {
    self.states = states
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Setup

  func setup() {
    titleLabel?.font = UIFont.boldSystemFontOfSize(12)
    imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
    setTitleColor(UIColor.grayColor(), forState: .Highlighted)

    select(index: selectedIndex)
  }

  // MARK: - Logic

  func toggle() -> Int {
    selectedIndex = (selectedIndex + 1) % states.count
    select(index: selectedIndex)

    return selectedIndex
  }

  func select(index index: Int) {
    guard index < states.count else { return }

    let state = states[index]

    setTitle(state.title, forState: .Normal)
    setImage(state.image, forState: .Normal)
  }
}
