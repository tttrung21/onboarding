
import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var currentIndex = 0
    var nextButton = UIButton(type: .system)
    var skipButton = UIButton(type: .system)
    var startButton = UIButton(type: .system)
    
    private let listView: [ItemModel] = [
        ItemModel(img: "View1", color: UIColor(red: 182/255, green: 166/255, blue: 141/255, alpha: 1.0), headline: "Track your work and get the result", sub: "Remember to keep track of your professional accomplishments."),
        ItemModel(img: "View2", color: UIColor(red: 255/255, green: 229/255, blue: 222/255, alpha: 1.0), headline: "Stay organized with team", sub: "But understanding the contributions our colleagues make to our teams and companies"),
        ItemModel(img: "View3", color: UIColor(red: 220/255, green: 246/255, blue: 230/255, alpha: 1.0), headline: "Get notified when work happens", sub: "Take control of notifications, collaborate live or on your own time")
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        updateView(for: currentIndex)
        updateButtons()
    }
}
//Buttons
extension OnboardingViewController{
    //Button Constraints
    func setButtonConstraints() {
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            skipButton.translatesAutoresizingMaskIntoConstraints = false
            startButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
            // "Skip" button constraints
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 58),
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -73),
                        
                // "Next" button constraints
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -58),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            nextButton.widthAnchor.constraint(equalToConstant: 118),
            nextButton.heightAnchor.constraint(equalToConstant: 68),
                
            // "Start" button constraints
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -96),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 96),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant: 68)
        ])
    }
    func setupButtonForView() {
        // Config skipButton
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(UIColor.black, for: .normal)
        skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)

        // Config nextButton
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        nextButton.backgroundColor = UIColor.black
        nextButton.layer.cornerRadius = 34
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        
        // Config startButton
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        startButton.backgroundColor = UIColor.black
        startButton.layer.cornerRadius = 34
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        startButton.isHidden = true
    }
    func setupButtons() {
        setupButtonForView()
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(startButton)
        setButtonConstraints()
    }
    func updateButtons(){
        skipButton.isHidden = currentIndex == 2
        nextButton.isHidden = currentIndex == 2
        startButton.isHidden = currentIndex != 2
    }
    // Button Actions
        @objc func nextTapped() {
            if currentIndex < listView.count - 1 {
                currentIndex += 1
                animateTransition(to: currentIndex)
                updateButtons()
            }
        }
        
        @objc func skipTapped() {
            if currentIndex < listView.count-1{
                currentIndex = listView.count-1
                animateTransition(to: currentIndex)
                updateButtons()
            }
            
        }
        
        @objc func startTapped() {
            if currentIndex == listView.count - 1{
                currentIndex = 0
                animateTransition(to: currentIndex)
                updateButtons()
            }
        }
}
//Update View
extension OnboardingViewController{
    func updateView(for index:Int){
        let data = listView[index]
        imageView.image = UIImage(named: data.img)
        headline.text = data.headline
        subtitle.text = data.sub
        view.backgroundColor = data.color
        
        pageControl.currentPage = index
    }
    private func animateTransition(to index: Int) {
            // Animation logic to transition between views
            UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.updateView(for: index)
            }, completion: nil)
        }
}
