import UIKit

struct CharacterItem {
    let imageName: String
    let name: String
    let role: String
    let age: String   // строкой, чтобы не спорить о каноне 😊
    let bio: String
}

final class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
   
    
    private let items: [CharacterItem] = [
        .init(imageName: "Tanjiro",   name: "Tanjiro Kamado",   role: "Slayer (Water/Sun)",  age: "16", bio: "Добрый и упёртый охотник. Обоняние и техники Воды/Солнца."),
        .init(imageName: "Zenitsu",   name: "Zenitsu Agatsuma", role: "Slayer (Thunder)",    age: "16", bio: "Пугается, но во сне — молниеносный мастер Грома."),
        .init(imageName: "Inosuke",   name: "Inosuke Hashibira",role: "Slayer (Beast)",      age: "15", bio: "Дикий боец в кабаньей маске. Интуиция и Звериное дыхание."),

        .init(imageName: "Giyu",      name: "Giyu Tomioka",     role: "Hashira (Water)",     age: "21",    bio: "Спокойный Столп Воды. Первый, кто встретил Тандзиро и Нэдзуко."),
        .init(imageName: "Shinobu",   name: "Shinobu Kocho",    role: "Hashira (Insect)",    age: "18",    bio: "Яды, скорость и техника Насекомого. Опасна за улыбкой."),
        .init(imageName: "Kyojuro",   name: "Kyojuro Rengoku",  role: "Hashira (Flame)",     age: "20",    bio: "Пылающее сердце и огненное дыхание. Харизма и отвага."),
        .init(imageName: "Mitsuri",   name: "Mitsuri Kanroji",  role: "Hashira (Love)",      age: "19",    bio: "Тёплая, но сверхсильная. Гибкость и плётевидный клинок."),
        .init(imageName: "Tengen",    name: "Tengen Uzui",      role: "Hashira (Sound)",     age: "23",    bio: "Блистательный шиноби. Тактика, взрывчатка и Звук."),
        .init(imageName: "Muichiro",  name: "Muichiro Tokito",  role: "Hashira (Mist)",      age: "14", bio: "Гений-молчун. Туманное дыхание и феноменальная реакция."),
        .init(imageName: "Sanemi",    name: "Sanemi Shinazugawa", role: "Hashira (Wind)",    age: "21",    bio: "Вспыльчивый, со шрамами. Беспощадный Столп Ветра."),
        .init(imageName: "Obanai",    name: "Obanai Iguro",     role: "Hashira (Serpent)",   age: "21",    bio: "Бинты и гетерохромия. Техники Змеи, змея Кабурамару."),
        .init(imageName: "Gyomei",    name: "Gyomei Himejima",  role: "Hashira (Stone)",     age: "27",    bio: "Сильнейший Столп. Слепой монах с цепом и топором."),

        .init(imageName: "Akaza",     name: "Akaza",            role: "Upper Rank Three",    age: "—",    bio: "Мастер рукопашного боя. «Компас» для добивания сильных."),
        .init(imageName: "Doma",      name: "Doma",             role: "Upper Rank Two",      age: "—",    bio: "Леденящая кровь и культ. Техники льда и холодное сердце."),
        .init(imageName: "Kokushibo", name: "Kokushibo",        role: "Upper Rank One",      age: "—",    bio: "Бывший мечник. Лунное дыхание и всевидящие глаза."),
        .init(imageName: "Gyutaro",   name: "Gyutaro",          role: "Upper Rank Six",      age: "—",    bio: "Смертоносные косы и яды. Сражается в паре с Даки."),
        .init(imageName: "Hantengu",  name: "Hantengu",         role: "Upper Rank Four",     age: "—",    bio: "Делится на эмоции-клоны, каждая с собственной силой."),
        .init(imageName: "Gyokko",    name: "Gyokko",           role: "Upper Rank Five",     age: "—",    bio: "Демон-гончар. Вылазит из кувшинов и творит уродливые «скульптуры»."),
        .init(imageName: "Nakime",    name: "Nakime",           role: "Infinity Castle",     age: "—",    bio: "Бива-девушка. Управляет Бесконечным замком, перемещая комнаты.")
    ]


    private var lastIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        styleUI()
        showRandom(animated: false)
    }
 
    @IBAction func randomizeTapped(_ sender: UIButton) {
        showRandom(animated: true)
        let gen = UIImpactFeedbackGenerator(style: .soft)
        gen.impactOccurred()
    }

    private func showRandom(animated: Bool) {
        guard !items.isEmpty else { return }
        var idx: Int
        repeat { idx = Int.random(in: 0..<items.count) } while idx == lastIndex && items.count > 1
        lastIndex = idx

        let it = items[idx]

        let update = {
            self.imageView.image = UIImage(named: it.imageName)
            self.nameLabel.text = it.name
            self.roleLabel.text = it.role
            self.ageLabel.text  = it.age
            self.bioLabel.text  = it.bio
        }

        if animated {
            UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve, animations: update, completion: nil)
        } else {
            update()
        }
    }


    private func styleUI() {
        
        view.backgroundColor = .systemBackground

        [roleLabel, ageLabel].forEach { label in
            label?.textColor = .white
            label?.backgroundColor = .systemIndigo
            label?.font = .systemFont(ofSize: 14, weight: .semibold)
            label?.layer.cornerRadius = 12
            label?.layer.masksToBounds = true
            label?.textAlignment = .center
            label?.setContentHuggingPriority(.required, for: .horizontal)
            label?.setContentCompressionResistancePriority(.required, for: .horizontal)
            label?.translatesAutoresizingMaskIntoConstraints = false
            if let l = label {
                l.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
                l.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
            }
        }

        nameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        nameLabel.textAlignment = .center

        bioLabel.textColor = .secondaryLabel
        bioLabel.numberOfLines = 0
        bioLabel.textAlignment = .center
    }
}


