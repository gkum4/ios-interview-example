import UIKit

class CharacterTableViewCell: UITableViewCell {
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterNameLabel)
        
        NSLayoutConstraint.activate([
            characterImage.widthAnchor.constraint(equalToConstant: 120),
            characterImage.heightAnchor.constraint(equalToConstant: 120),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            characterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            characterNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 12),
            characterNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
}
