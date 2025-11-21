import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let sections: [FavoriteSection] = [
        FavoriteSection(
            title: "Favorite Movies",
            items: [
                FavoriteItem(title: "Inception",
                             subtitle: "Christopher Nolan, 2010",
                             review: "Нравится за сложный сюжет и атмосферу снов. Каждый пересмотр открывает новые детали.",
                             systemImageName: "film"),
                FavoriteItem(title: "Interstellar",
                             subtitle: "Christopher Nolan, 2014",
                             review: "Трогательная история про семью и космос. Красивая музыка и визуал.",
                             systemImageName: "sparkles"),
                FavoriteItem(title: "The Matrix",
                             subtitle: "Wachowski, 1999",
                             review: "Классика про выбор и реальность. Фильм заставляет задуматься.",
                             systemImageName: "network"),
                FavoriteItem(title: "The Dark Knight",
                             subtitle: "Christopher Nolan, 2008",
                             review: "Один из лучших фильмов про супергероев. Очень сильный злодей.",
                             systemImageName: "shield"),
                FavoriteItem(title: "Forrest Gump",
                             subtitle: "Robert Zemeckis, 1994",
                             review: "Добрый и простой герой, через которого показана история целой страны.",
                             systemImageName: "figure.walk")
            ]
        ),
        FavoriteSection(
            title: "Favorite Music",
            items: [
                FavoriteItem(title: "Coldplay",
                             subtitle: "Band",
                             review: "Лиричные песни и приятная атмосфера. Часто слушаю в фоне.",
                             systemImageName: "music.note.list"),
                FavoriteItem(title: "Imagine Dragons",
                             subtitle: "Band",
                             review: "Энергичная музыка, хорошо подходит для спорта и мотивации.",
                             systemImageName: "bolt.fill"),
                FavoriteItem(title: "Hans Zimmer",
                             subtitle: "Composer",
                             review: "Саундтреки, которые создают сильные эмоции и запоминаются надолго.",
                             systemImageName: "music.quarternote.3"),
                FavoriteItem(title: "Daft Punk – Random Access Memories",
                             subtitle: "Album",
                             review: "Интересное сочетание электроники и живых инструментов.",
                             systemImageName: "headphones"),
                FavoriteItem(title: "Lo-fi Beats",
                             subtitle: "Playlist",
                             review: "Идеально подходит для учебы и работы, не отвлекает, но создает настроение.",
                             systemImageName: "waveform")
            ]
        ),
        FavoriteSection(
            title: "Favorite Books",
            items: [
                FavoriteItem(title: "1984",
                             subtitle: "George Orwell",
                             review: "Сильная антиутопия, показывает, к чему может привести контроль.",
                             systemImageName: "book"),
                FavoriteItem(title: "The Pragmatic Programmer",
                             subtitle: "Andrew Hunt, David Thomas",
                             review: "Полезная книга про мышление разработчика и подход к коду.",
                             systemImageName: "laptopcomputer"),
                FavoriteItem(title: "Clean Code",
                             subtitle: "Robert C. Martin",
                             review: "Помогает писать более понятный и чистый код.",
                             systemImageName: "text.alignleft"),
                FavoriteItem(title: "Sapiens",
                             subtitle: "Yuval Noah Harari",
                             review: "Интересный взгляд на историю человечества простым языком.",
                             systemImageName: "globe"),
                FavoriteItem(title: "Atomic Habits",
                             subtitle: "James Clear",
                             review: "Про маленькие привычки и их влияние на результат в долгую.",
                             systemImageName: "checkmark.circle")
            ]
        ),
        FavoriteSection(
            title: "Favorite University Courses",
            items: [
                FavoriteItem(title: "Algorithms and Data Structures",
                             subtitle: "CS Course",
                             review: "Даёт базу, которая нужна в любой области программирования.",
                             systemImageName: "slider.horizontal.3"),
                FavoriteItem(title: "Mobile Development (iOS)",
                             subtitle: "CS / SE Course",
                             review: "Практический курс, на котором можно делать реальные приложения.",
                             systemImageName: "iphone"),
                FavoriteItem(title: "Databases",
                             subtitle: "CS Course",
                             review: "Понимание, как хранить и доставать данные эффективно.",
                             systemImageName: "internaldrive"),
                FavoriteItem(title: "Computer Networks",
                             subtitle: "CS Course",
                             review: "Помогает понять, как на самом деле работает интернет.",
                             systemImageName: "network"),
                FavoriteItem(title: "Software Engineering",
                             subtitle: "CS / SE Course",
                             review: "Про командную разработку, процессы и архитектуру.",
                             systemImageName: "person.3.sequence")
            ]
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteItemCell.self, forCellReuseIdentifier: "FavoriteItemCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let item = section.items[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItemCell", for: indexPath) as? FavoriteItemCell
            ?? FavoriteItemCell(style: .default, reuseIdentifier: "FavoriteItemCell")

        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



