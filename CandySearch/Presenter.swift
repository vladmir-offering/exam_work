protocol AboutPresenterProtocol: class {
    weak var view: AboutViewProtocol!
    var interactor: AboutInteractorProtocol!
    var router: AboutRouterProtocol!
  var detailCandy: Candy? {
    didSet {
      configureView()
    }
  }
     required init(view: AboutViewProtocol) {
        self.view = view
    }
    var router: AboutRouterProtocol! { set get }
      func configureView() {
    if let detailCandy = detailCandy {
      if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView {
        detailDescriptionLabel.text = detailCandy.name
        candyImageView.image = UIImage(named: detailCandy.name)
        title = detailCandy.category
        configurator.configure(with: self)
        
      }
    }
  }
    func closeButtonClicked()
}