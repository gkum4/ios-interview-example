import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterTableViewCell.self,
                           forCellReuseIdentifier: "CharacterCell")
        tableView.backgroundView = activity
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    var characters: [DisneyCharacter] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        CharactersViewModel().loadCharacters { disneyCharacters, error in
            guard let disneyCharacters else { return }
            
            self.characters = disneyCharacters
            self.activity.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func setupView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterTableViewCell
        else { return UITableViewCell() }
        
        let character = characters[indexPath.row]
        cell.characterNameLabel.text = character.name
        
        if let imageUrl = character.imageUrl {
            CharactersViewModel().fetchCharacterImage(for: imageUrl) { image, error in
                if let image {
                    cell.characterImage.image = image
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        let alert = UIAlertController(title: "Este personagem aparece em",
                                      message: character.films.joined(separator: ","),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true)
    }
}

