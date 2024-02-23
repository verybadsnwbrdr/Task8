import UIKit

final class ViewController: UIViewController {
	private let scrollView = UIScrollView()
	private let imageView = makeImageView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		navigationItem.title = "Avatar"
		navigationController?.navigationBar.prefersLargeTitles = true

		view.addSubview(scrollView)
		scrollView.frame = view.bounds
		scrollView.contentSize.height = 2000
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		addProfileImageToNavigationBar()
	}

	private func addProfileImageToNavigationBar() {
		guard imageView.superview == nil else {
			return
		}
		let largeTitleView = navigationController?
			.navigationBar
			.subviews
			.first { view in view.subviews.contains { $0 is UILabel } }

		largeTitleView.map(addImageView)
	}

	private func addImageView(largeTitleView: UIView) {
		largeTitleView.addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -8),
			imageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 36),
			imageView.heightAnchor.constraint(equalToConstant: 36)
		])
	}

	private static func makeImageView() -> UIImageView {
		let imageName = "person.crop.circle.fill"
		let image = UIImage(systemName: imageName)?.withTintColor(.gray, renderingMode: .alwaysOriginal)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}
}
