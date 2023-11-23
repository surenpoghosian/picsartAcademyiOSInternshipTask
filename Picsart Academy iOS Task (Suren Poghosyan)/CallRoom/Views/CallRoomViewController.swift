//
//  CallRoom.swift
//  Picsart Academy iOS Task (Suren Poghosyan)
//
//  Created by Suren Poghosyan on 22.11.23.
//

import UIKit

class CallRoomViewController: UIViewController {
    
    private var callRoomWindowStackView: UIStackView!
    private var buttonsStackView: UIStackView!

    private var userWindowsCollectionView: UICollectionView!
    private let userWindowsCllectionViewFlowLayout = UICollectionViewFlowLayout()

    private var addButton: UIButton!
    private var removeButton: UIButton!
    
    private let screenSize = UIScreen.main.bounds
    
    private var viewModel: CallRoomViewModel!
    private var collectionViewlayouts: CollectionViewLayouts!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CallRoomViewModel()
        collectionViewlayouts = CollectionViewLayouts()
        viewModel.onChange = reloadCollectionViewData
        setupCallRoomViewController()
        configureLayout()
    }
    
    
//    function for layout change animation
    func animateLayoutTransition(to layout: UICollectionViewLayout) {
        UIView.animate(withDuration: 0.5) {
            self.userWindowsCollectionView.setCollectionViewLayout(layout, animated: true)
        }
    }

//    function which checks users count in userslist and rearranges collection view layout
    func configureLayout() {
        let itemCount = viewModel.usersList.count
        switch itemCount {
        case 0:
            break
        case 1:
            animateLayoutTransition(to: collectionViewlayouts.getSingleItemLayout())
        case 2:
            animateLayoutTransition(to: collectionViewlayouts.getTwoHalfScreenItemsLayout())
        case 3...5:
            animateLayoutTransition(to: collectionViewlayouts.getHalfScreenAndQuartersLayout())
        case 6...8:
            animateLayoutTransition(to: collectionViewlayouts.getQuartersAndEighthsLayout())
        case 8...10:
            animateLayoutTransition(to: collectionViewlayouts.getHalfAndQuartersAndEighthLayout())
        default:
            print("OH NO SOMETHING WENT WRONG!!!")
        }
    }
    
//    calling all setup functions of Call Room view controller, and some more modificattions
    private func setupCallRoomViewController(){
        // ----ALERT----  do not change the order of these setup functions
        setupUserWindowsCollectionView()
        setupUserWindowsCollectionViewCell()
        setupAddButton()
        setupRemoveButton()
        setupButtonsStackView()
        setupCallRoomStackView()
        
        
        view.addSubview(callRoomWindowStackView)
    }
    
//    initiating and setting up userWindowsCollectionView
    private func setupUserWindowsCollectionView() {
        userWindowsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: userWindowsCllectionViewFlowLayout)
        userWindowsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        userWindowsCollectionView.dataSource = self
        userWindowsCollectionView.delegate = self
        userWindowsCollectionView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            userWindowsCollectionView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.9),
            userWindowsCollectionView.widthAnchor.constraint(equalToConstant: screenSize.width)
        ])
            }
    
//    initiating Collection View Cell
    private func setupUserWindowsCollectionViewCell(){
        userWindowsCollectionView.register(CallRoomUserWindowsCollectionViewCell.self, forCellWithReuseIdentifier: "UserWindowsCollectionViewUserWindowCell")

    }
    
//    this function handles click on collection view cell removes it and rearranges layout
    private func onCellClick(user: User){
        
        if let index = viewModel.usersList.firstIndex(where: { $0.title == user.title }) {
            let indexPath = IndexPath(item: index, section: 0)
            
            userWindowsCollectionView.performBatchUpdates({
                if let cell = userWindowsCollectionView.cellForItem(at: indexPath) as? CallRoomUserWindowsCollectionViewCell {
                    animateCell(cell)
                }

                viewModel.removeUser(user: user)

                userWindowsCollectionView.deleteItems(at: [indexPath])
                
            }, completion: nil)
        }
    }
        
//    initiating and setting up add button
    private func setupAddButton() {
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("ADD", for: .normal)
        addButton.backgroundColor = .black
        addButton.addAction(UIAction { _ in
            self.onAddUser()
        }, for: .touchUpInside)
        
    }

    // Function to add a new user
    private func onAddUser() {
        guard viewModel.usersList.count <= 9 else {
            return
        }

        let newUser = User(title: firstUnfilledTitle())
        viewModel.addUser(user: newUser)
    }

//    helper function for seeking not used index
    private func firstUnfilledTitle() -> String {
        let usedIndices = Set(viewModel.usersList.map { $0.title })
        for index in 1...10 {
            if !usedIndices.contains("\(index)") {
                return "\(index)"
            }
        }
        
        return "Error"
    }
    
    
//    initiating and setting up remove add button
    private func setupRemoveButton() {
        removeButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.setTitle("REMOVE", for: .normal)
        removeButton.backgroundColor = .black
        removeButton.addAction(UIAction {_ in
            self.onRemoveUser()
            self.reloadCollectionViewData()

        }, for: .touchUpInside)
        

    }
    

//    this function is triggered on remove button click
    private func onRemoveUser() {
        guard viewModel.usersList.count > 0 else {
            return
        }

        let indexPath = IndexPath(item: viewModel.usersList.count - 1, section: 0)

        userWindowsCollectionView.performBatchUpdates({
            if let cell = userWindowsCollectionView.cellForItem(at: indexPath) as? CallRoomUserWindowsCollectionViewCell {
                animateCell(cell)
            }

            viewModel.removeLastUser()

            userWindowsCollectionView.deleteItems(at: [indexPath])
        }, completion: nil)
    }
    
//    initiating and setting up call room stack view - it contains userWindowsCollectionView and buttonsStackView
    private func setupCallRoomStackView() {
        callRoomWindowStackView = UIStackView()
        callRoomWindowStackView.axis = .vertical
        callRoomWindowStackView.translatesAutoresizingMaskIntoConstraints = false
        callRoomWindowStackView.addArrangedSubview(userWindowsCollectionView)
        callRoomWindowStackView.addArrangedSubview(buttonsStackView)
        callRoomWindowStackView.spacing = 16
        
        
        userWindowsCollectionView.contentMode = .top
        
        buttonsStackView.contentMode = .bottom
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: callRoomWindowStackView.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: callRoomWindowStackView.trailingAnchor, constant: -20),
        ])

        
    }
    
//    initiating and setting up buttons stack view - it contains add and remove buttons
    private func setupButtonsStackView() {
        buttonsStackView = UIStackView()
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 16
        buttonsStackView.axis = .horizontal
        buttonsStackView.addArrangedSubview(addButton)
        buttonsStackView.addArrangedSubview(removeButton)
        
        
    }
    
//    reloading collecting view data and rearranging layout
    func reloadCollectionViewData() {
        userWindowsCollectionView.reloadData()
        DispatchQueue.main.async {
            self.configureLayout()
        }

    }
    
    func animateCell(_ cell: CallRoomUserWindowsCollectionViewCell) {
         cell.alpha = 0.0

         UIView.animate(withDuration: 0.5, animations: {
             cell.alpha = 1.0
         })
     }
}

// extension to create colleciton view cell
extension CallRoomViewController: UICollectionViewDataSource {
//    setting secitions number in collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
//    setting cells number based on our list items from view model
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.usersList.count
    }
    
//    initiating and configuring cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserWindowsCollectionViewUserWindowCell", for: indexPath) as! CallRoomUserWindowsCollectionViewCell
        cell.configure(title: self.viewModel.usersList[indexPath.row].title)
        
        if indexPath.item == collectionView.numberOfItems(inSection: 0) - 1 {
             animateCell(cell)
         }
        
        return cell

    }
}



extension CallRoomViewController: UICollectionViewDelegate {
// handling click on cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onCellClick(user: self.viewModel.usersList[indexPath.row])
        collectionView.deselectItem(at: indexPath, animated: true)

    }
}
