import UIKit

struct FavoriteItem {
    let title: String
    let subtitle: String
    let detailDescription: String
    let review: String
    let systemImageName: String
    let ratingText: String
}

enum FavoriteCategory: CaseIterable {
    case movies
    case music
    case books
    case courses

    var title: String {
        switch self {
        case .movies: return "Movies"
        case .music: return "Music"
        case .books: return "Books"
        case .courses: return "Courses"
        }
    }

    var tabIconName: String {
        switch self {
        case .movies: return "film"
        case .music: return "music.note"
        case .books: return "book"
        case .courses: return "graduationcap"
        }
    }

    var selectedTabIconName: String {
        switch self {
        case .movies: return "film.fill"
        case .music: return "music.note.list"
        case .books: return "book.fill"
        case .courses: return "graduationcap.fill"
        }
    }

    var accentColor: UIColor {
        switch self {
        case .movies: return .systemPink
        case .music: return .systemIndigo
        case .books: return .systemGreen
        case .courses: return .systemOrange
        }
    }

    var items: [FavoriteItem] {
        switch self {
        case .movies:
            return [
                FavoriteItem(
                    title: "Inception",
                    subtitle: "Christopher Nolan · 2010",
                    detailDescription: """
Dom Cobb assembles a crew to plant an idea inside a dreamer's subconscious. The movie layers time dilation rules with heist-movie momentum so every hallway fight alters the mission clock. Practical effects blend with surreal geography that still looks modern a decade later. By the final cut to the spinning top, the story quietly asks what it costs to live in a memory.
""",
                    review: "Rewatching never feels repetitive because I still find new details in the snow fortress and limbo sequences. It is my gold standard for blockbuster pacing.",
                    systemImageName: "film.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.5/10"
                ),
                FavoriteItem(
                    title: "Interstellar",
                    subtitle: "Christopher Nolan · 2014",
                    detailDescription: """
Earth is failing and a small crew searches for a new home via a wormhole next to Saturn. Time dilation on Miller's water planet shows how relativity can shatter families. Hans Zimmer's organ-heavy score turns docking sequences into spiritual moments. The film balances hard science concepts with a very human story about a father keeping a promise.
""",
                    review: "The bookshelf reveal gets me every single time and I love how tactile the Endurance spacecraft feels. It is the rare sci-fi film that earns its optimism.",
                    systemImageName: "sparkles",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "The Matrix",
                    subtitle: "Lana & Lilly Wachowski · 1999",
                    detailDescription: """
Neo wakes up to a reality where humanity unknowingly powers a machine-controlled simulation. Bullet time, leather coats, and Hong Kong-inspired wire work changed action language overnight. The film mixes cyberpunk aesthetics with ancient myths about choice and destiny. Even today its practical stunts and confidently weird philosophy feel refreshing.
""",
                    review: "Whenever I hear the lobby shootout score I instinctively slow-mo dive behind imaginary pillars. It's endlessly quotable and stylish.",
                    systemImageName: "network",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "The Dark Knight",
                    subtitle: "Christopher Nolan · 2008",
                    detailDescription: """
Gotham faces a Joker who wants to prove that chaos lives inside everyone. Ledger's performance is electric because every line feels improvised yet targeted. The film stages moral dilemmas on boats, in interrogation rooms, and on Hong Kong skyscrapers. It remains a crime thriller first and a superhero film second, which keeps it timeless.
""",
                    review: "I still hold my breath during the truck flip even though I know the outcome. The themes about surveillance and sacrifice aged surprisingly well.",
                    systemImageName: "shield.lefthalf.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.3/10"
                ),
                FavoriteItem(
                    title: "Arrival",
                    subtitle: "Denis Villeneuve · 2016",
                    detailDescription: """
Twelve alien ships land quietly, and a linguist tries to decode a circular language that rewires time. The film treats communication like a puzzle, showing how shared symbols change relationships. Bradford Young's muted cinematography makes the ships feel both massive and intimate. The twist reframes every previous scene with an emotional punch.
""",
                    review: "The gravity-shifting hallway shot is my favorite moment because it instantly conveys wonder. It's a calm sci-fi film that still feels tense.",
                    systemImageName: "bubble.left.and.bubble.right.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.8/10"
                ),
                FavoriteItem(
                    title: "Whiplash",
                    subtitle: "Damien Chazelle · 2014",
                    detailDescription: """
An ambitious drummer joins a conservatory band led by a ruthless instructor. The movie treats rehearsals like boxing matches where sweat and cymbal crashes replace punches. Tight editing keeps every tempo change physically stressful. The ending drum solo is a wordless conversation about obsession.
""",
                    review: "It makes me sit up straight every time because the tension never lets go. I love how it shows art as both craft and competition.",
                    systemImageName: "metronome.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.7/10"
                ),
                FavoriteItem(
                    title: "The Grand Budapest Hotel",
                    subtitle: "Wes Anderson · 2014",
                    detailDescription: """
Set in a fictional European resort, the story follows concierge Gustave H. through conspiracies and pastry chases. Anderson frames every shot like a postcard while still letting the characters feel messy. The nested timelines keep the pace brisk and playful. Alexandre Desplat's score adds whimsy without undercutting the melancholy.
""",
                    review: "I rewatch it whenever I want color inspiration or dry humor. The made-up pastries somehow make me hungry every time.",
                    systemImageName: "building.columns",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.6/10"
                ),
                FavoriteItem(
                    title: "Spider-Man: Into the Spider-Verse",
                    subtitle: "Sony Animation · 2018",
                    detailDescription: """
Miles Morales discovers other spider-people when the multiverse glitches. The art style mixes comic halftones, graffiti, and anime flourishes frame by frame. The story leans on family conversations just as much as action, making the stakes feel personal. It proves superhero movies can still surprise with bold design choices.
""",
                    review: "The leap-of-faith sequence is animated perfection and the soundtrack stays on repeat for weeks. It's joyful without being corny.",
                    systemImageName: "hare.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.2/10"
                ),
                FavoriteItem(
                    title: "The Social Network",
                    subtitle: "David Fincher · 2010",
                    detailDescription: """
College dorms, depositions, and coding sessions collide while Facebook scales. Fincher directs it like a courtroom thriller, with dialogue that snaps like drumsticks. Trent Reznor and Atticus Ross score the movie with icy synths that make Harvard feel ominous. It captures how ambition can fracture friendships.
""",
                    review: "I still reference the 'drop the the' scene whenever we debate product names. The pacing makes legal jargon feel gripping.",
                    systemImageName: "person.2.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.9/10"
                ),
                FavoriteItem(
                    title: "Everything Everywhere All at Once",
                    subtitle: "Daniels · 2022",
                    detailDescription: """
An overwhelmed laundromat owner gets dragged into a multiverse battle with hot-dog fingers and googly eyes. The film leaps between absurd comedy and heartfelt family drama without losing control. Inventive editing lets a handful of sets feel infinite. At its core it argues that kindness can be the loudest superpower.
""",
                    review: "I laughed, cried, and immediately texted my mom afterward. It makes maximalism feel intimate.",
                    systemImageName: "infinity.circle.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.4/10"
                )
            ]
        case .music:
            return [
                FavoriteItem(
                    title: "Random Access Memories",
                    subtitle: "Daft Punk · 2013",
                    detailDescription: """
The duo traded sample-heavy loops for live studio musicians and lush analog gear. Each track feels like a mini documentary about the history of dance music. The pacing lets grooves breathe so the listener can appreciate every Rhodes flourish. Hearing Nile Rodgers' guitar glide across the mix is a masterclass in restraint.
""",
                    review: "I reach for it whenever I need focus without losing energy. 'Touch' and 'Instant Crush' still surprise me with new layers.",
                    systemImageName: "headphones",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.5/10"
                ),
                FavoriteItem(
                    title: "Folklore",
                    subtitle: "Taylor Swift · 2020",
                    detailDescription: """
Taylor pivoted to cottage-core storytelling with Aaron Dessner's delicate production. The album feels like reading short stories set in mossy cabins. Muted drums, fingerpicked guitars, and layered vocals create a calm nighttime mood. It proved she could world-build without flashy hooks.
""",
                    review: "This is my go-to rainy day soundtrack and it pairs perfectly with tea. 'August' wrecks me every time the bridge hits.",
                    systemImageName: "music.quarternote.3",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "In Rainbows",
                    subtitle: "Radiohead · 2007",
                    detailDescription: """
Radiohead self-released the album online, but the real innovation lives in the arrangements. Interlocking guitars and Thom Yorke's falsetto sit on top of swampy bass lines. The record manages to feel warm even when the lyrics get abstract. Every track transitions seamlessly, making it hard to play just one song.
""",
                    review: "The opening high-hat pattern of '15 Step' instantly snaps me into work mode. It's headphone candy.",
                    systemImageName: "waveform",
                    ratingText: "⭐️⭐️⭐️⭐️ 9.2/10"
                ),
                FavoriteItem(
                    title: "Kind of Blue",
                    subtitle: "Miles Davis · 1959",
                    detailDescription: """
Modal jazz stripped away chord clutter so improvisers could paint with melody. The sessions were famously recorded with almost no rehearsal, yet every take sounds patient. Bill Evans' piano voicings leave space for the horns to breathe. It's the rare classic that still feels modern to newcomers.
""",
                    review: "Perfect writing music; it keeps me calm without fading into the background. The trumpet tone is butter.",
                    systemImageName: "music.note.list",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.3/10"
                ),
                FavoriteItem(
                    title: "To Pimp a Butterfly",
                    subtitle: "Kendrick Lamar · 2015",
                    detailDescription: """
Kendrick mixes jazz, funk, and spoken word to document a personal and political journey. The sequencing feels like a stage play as recurring poems evolve. Live musicianship keeps the record organic even when the themes get heavy. It rewards full-album listens because motifs keep resurfacing.
""",
                    review: "The bass tone on 'Alright' rattles my car speakers in the best way. It's dense but uplifting.",
                    systemImageName: "mic.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.6/10"
                ),
                FavoriteItem(
                    title: "Future Nostalgia",
                    subtitle: "Dua Lipa · 2020",
                    detailDescription: """
Disco strings and four-on-the-floor drums meet modern pop writing. Every chorus is engineered for the dance floor, yet the lyrics maintain personality. The production sprinkles subtle guitar licks and talkbox moments that reward replays. It's a confident record that knows exactly what mood it wants to create.
""",
                    review: "Instant energy boost for workouts or mid-day slumps. 'Levitating' refuses to leave my head, and I'm okay with it.",
                    systemImageName: "sparkles",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.8/10"
                ),
                FavoriteItem(
                    title: "Blonde",
                    subtitle: "Frank Ocean · 2016",
                    detailDescription: """
Frank leans into minimal arrangements where silence becomes an instrument. Pitch-shifted vocals and dreamy guitars feel like memories surfacing out of order. The nonlinear structure mirrors the way nostalgia works in real life. It is intimate without oversharing.
""",
                    review: "I love how it makes late-night drives feel cinematic. 'Nights' switching beats at the halfway mark never gets old.",
                    systemImageName: "person.wave.2",
                    ratingText: "⭐️⭐️⭐️⭐️ 9.1/10"
                ),
                FavoriteItem(
                    title: "Abbey Road",
                    subtitle: "The Beatles · 1969",
                    detailDescription: """
Side B stitches together song fragments into a legendary medley. The production feels polished thanks to new studio gear and playful experimentation. George Harrison's songwriting peak shows up on 'Something' and 'Here Comes the Sun'. Even with backstage tension, the band sounds united.
""",
                    review: "Whenever I need a reminder of tight vocal harmonies, I revisit the closing suite. It's rock comfort food.",
                    systemImageName: "guitars",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "Back to Black",
                    subtitle: "Amy Winehouse · 2006",
                    detailDescription: """
Mark Ronson's retro soul production frames Amy's smoky vocals perfectly. The lyrics read like diary entries delivered with wit and sting. Horn stabs and tambourines give the record a live-band feel. It's raw emotion disguised as vintage Motown.
""",
                    review: "Her phrasing still surprises me with tiny rhythmic choices. It's my default album when I want something dramatic.",
                    systemImageName: "music.mic",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.9/10"
                ),
                FavoriteItem(
                    title: "Currents",
                    subtitle: "Tame Impala · 2015",
                    detailDescription: """
Kevin Parker pivoted from psych-rock guitars to synth-driven heartbreak anthems. The drums remain crunchy and human even when everything else is digital. Lyrics about change and self-reflection make the glossy production feel vulnerable. It's headphone music that also works at parties.
""",
                    review: "The opening bass on 'Let It Happen' is my favorite way to start a coding session. The album feels like a color gradient.",
                    systemImageName: "dial.medium.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.7/10"
                )
            ]
        case .books:
            return [
                FavoriteItem(
                    title: "1984",
                    subtitle: "George Orwell",
                    detailDescription: """
Orwell imagines a surveillance state where language itself becomes a prison. The book shows how control over truth can erode relationships. Winston and Julia's rebellion feels doomed yet necessary. It's a warning that still pops up in modern conversations about privacy.
""",
                    review: "Re-reading it during the age of smartphones hit harder than in school. It keeps me mindful about the tools I build.",
                    systemImageName: "text.book.closed.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9.2/10"
                ),
                FavoriteItem(
                    title: "The Pragmatic Programmer",
                    subtitle: "Andrew Hunt & David Thomas",
                    detailDescription: """
Each chapter delivers sticky metaphors like broken windows and tracer bullets. The authors show how to balance craftsmanship with shipping solutions. I appreciate that the advice spans careers, not just tools. It feels like a conversation with a thoughtful mentor.
""",
                    review: "Whenever I'm stuck, I skim the tip list for inspiration. It helped shape how I write documentation and mentor teammates.",
                    systemImageName: "hammer.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "Clean Code",
                    subtitle: "Robert C. Martin",
                    detailDescription: """
This book dissects functions the way chefs critique recipes. It focuses on naming, small classes, and the courage to refactor. Some examples feel old-school, yet the core ideas about readability remain timeless. It taught me to treat tests as first-class citizens.
""",
                    review: "I don't follow every rule, but it gave me a language for code smells. Great for leveling up conversations during reviews.",
                    systemImageName: "line.3.horizontal.decrease.circle",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.8/10"
                ),
                FavoriteItem(
                    title: "Sapiens",
                    subtitle: "Yuval Noah Harari",
                    detailDescription: """
Harari zooms out to show how shared myths let humans collaborate at scale. The narrative jumps from hunter-gatherer camps to corporate boardrooms. It mixes anthropology, economics, and philosophy without feeling like a lecture. I left with a better grasp of why stories matter.
""",
                    review: "I love giving this book to friends who enjoy big-picture thinking. It sparks great dinner debates.",
                    systemImageName: "globe.europe.africa.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9.1/10"
                ),
                FavoriteItem(
                    title: "Atomic Habits",
                    subtitle: "James Clear",
                    detailDescription: """
Clear turns behavior science into bite-sized tactics you actually try. The book emphasizes identity over goals, which reframed how I plan projects. Visual cues like habit stacking make the advice actionable. It's the rare self-help book that respects your time.
""",
                    review: "I still use the two-minute rule whenever I need to start a task I dread. The design of the book is clean and inviting.",
                    systemImageName: "checkmark.circle.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.9/10"
                ),
                FavoriteItem(
                    title: "Dune",
                    subtitle: "Frank Herbert",
                    detailDescription: """
Political intrigue, ecological warnings, and spice visions converge on Arrakis. Herbert writes with a density that makes the universe feel ancient. The alternating viewpoints give the story an epic scope. It's a sci-fi novel that rewards patience.
""",
                    review: "I reread it before the recent film adaptation and still discovered new layers. The Bene Gesserit voice exercises are oddly calming.",
                    systemImageName: "sun.max.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "Educated",
                    subtitle: "Tara Westover",
                    detailDescription: """
Tara grows up in a survivalist family with no formal schooling, then finds academia. The memoir balances empathy for her roots with a desire to grow beyond them. It explores memory, trauma, and the pursuit of knowledge. Her voice is raw but hopeful.
""",
                    review: "It reminded me not to take classrooms for granted. I tore through it in two sittings.",
                    systemImageName: "person.crop.rectangle.stack.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.7/10"
                ),
                FavoriteItem(
                    title: "The Midnight Library",
                    subtitle: "Matt Haig",
                    detailDescription: """
Between life and death lies a library where each book is an alternate life. The protagonist samples regrets and learns what actually brings joy. The premise could feel gimmicky, but Haig keeps it grounded. It's a gentle story that nudges you toward gratitude.
""",
                    review: "Great palate cleanser after heavier reads. It made me catalog the tiny decisions I'm thankful for.",
                    systemImageName: "books.vertical.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.5/10"
                ),
                FavoriteItem(
                    title: "Deep Work",
                    subtitle: "Cal Newport",
                    detailDescription: """
Newport argues that focus is a competitive advantage in noisy offices. He mixes research with rituals that help carve out distraction-free time. Case studies range from stone masons to programmers. It's a manifesto that makes you want to close every notification immediately.
""",
                    review: "I adopted time blocks after reading this and never looked back. Worth a yearly reread.",
                    systemImageName: "brain.head.profile",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "The Name of the Wind",
                    subtitle: "Patrick Rothfuss",
                    detailDescription: """
Kvothe narrates his life from gifted orphan to legendary arcanist. The prose is lyrical, making even tavern scenes feel magical. Magic here behaves like physics, which grounds the fantasy. The framing device keeps the mystery of the future alive.
""",
                    review: "Waiting for book three is painful, but revisiting the first two is still rewarding. The audiobook performance is excellent.",
                    systemImageName: "wand.and.stars.inverse",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.9/10"
                )
            ]
        case .courses:
            return [
                FavoriteItem(
                    title: "Algorithms & Data Structures",
                    subtitle: "Core CS Sequence",
                    detailDescription: """
This course teaches you how to reason about performance before you write code. From heaps to suffix arrays, every unit pairs proofs with real projects. Weekly labs emphasize drawing diagrams instead of guessing. It is the backbone for every other technical topic.
""",
                    review: "Whenever I ace a whiteboard interview, I silently thank this class. The habit of analyzing complexity stuck with me.",
                    systemImageName: "chart.bar.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.5/10"
                ),
                FavoriteItem(
                    title: "Operating Systems",
                    subtitle: "Systems Programming",
                    detailDescription: """
You build schedulers, shells, and memory allocators from scratch. Understanding context switches suddenly makes laptop hiccups less mysterious. The labs demand careful debugging, which sharpens patience. It bridges low-level theory with the apps we use daily.
""",
                    review: "After writing a tiny kernel, I stopped treating OSes like magic. Easily the most humbling course I've taken.",
                    systemImageName: "cpu.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "Computer Networks",
                    subtitle: "Packets & Protocols",
                    detailDescription: """
From physical layers to application protocols, the class walks up the entire stack. Wireshark labs turn abstract headers into tangible data. Simulating congestion control shows why latency spikes happen. It gives you empathy for anyone running infrastructure.
""",
                    review: "Now I can't help but inspect response headers when something feels slow. It's nerdy but practical.",
                    systemImageName: "dot.radiowaves.left.and.right",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.8/10"
                ),
                FavoriteItem(
                    title: "Database Systems",
                    subtitle: "Data Management",
                    detailDescription: """
You implement storage engines, query planners, and transaction managers in teams. The course explains why indexes and locking strategies exist beyond buzzwords. Real-world war stories from TA internships keep lectures grounded. By the final project you think in schemas automatically.
""",
                    review: "It turned SQL from a checklist item into a problem-solving tool. I left with a healthy respect for DBA work.",
                    systemImageName: "externaldrive.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9.1/10"
                ),
                FavoriteItem(
                    title: "Mobile Development (iOS)",
                    subtitle: "Applied Software Engineering",
                    detailDescription: """
Students ship a fully functional app by the end of the quarter. Lectures cover UIKit, SwiftUI, and the realities of App Store submissions. Weekly code reviews reinforce design patterns like MVVM and Coordinator. It's fast paced but extremely rewarding when you demo on real devices.
""",
                    review: "This assignment is basically a love letter to that course. Nothing beats seeing your code on a phone.",
                    systemImageName: "iphone",
                    ratingText: "⭐️⭐️⭐️⭐️ 9.3/10"
                ),
                FavoriteItem(
                    title: "Machine Learning",
                    subtitle: "Data Science Core",
                    detailDescription: """
Regression, classification, and neural networks all live under one syllabus. Assignments mix mathematical derivations with notebook experiments. The instructors push ethical discussions alongside technical ones. It demystifies the buzz by forcing you to implement algorithms yourself.
""",
                    review: "Gradient descent finally clicked here thanks to great visualizations. I use the intuition daily when interpreting model metrics.",
                    systemImageName: "waveform.path.ecg",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "Human-Computer Interaction",
                    subtitle: "Design Studio",
                    detailDescription: """
Personas, prototypes, and usability testing dominate the semester. The class breaks the myth that design is just intuition. Each sprint ends with user feedback that often contradicts your assumptions. It made me a more empathetic engineer.
""",
                    review: "Now I watch people tap through my apps and take notes instead of defending decisions. That mindset shift is priceless.",
                    systemImageName: "paintbrush.pointed.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.7/10"
                ),
                FavoriteItem(
                    title: "Software Engineering Practices",
                    subtitle: "Team Project",
                    detailDescription: """
Scrum ceremonies, CI pipelines, and code reviews become second nature here. The focus is less on algorithms and more on collaboration. You rotate roles so everyone experiences planning, testing, and release management. It mirrors a real product team better than any internship prep book.
""",
                    review: "I left with templates for sprint docs that I still use. The peer feedback rounds were surprisingly candid in a good way.",
                    systemImageName: "person.3.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 9/10"
                ),
                FavoriteItem(
                    title: "Cloud Computing Fundamentals",
                    subtitle: "Infrastructure Track",
                    detailDescription: """
Projects walk through deploying microservices on multiple providers. You compare managed services, write Terraform, and practice blue-green releases. The course demystifies cost models and observability stacks. It prepares you for on-call life without pager panic.
""",
                    review: "Spinning up clusters felt empowering instead of intimidating afterward. Now I actually enjoy discussing billing graphs.",
                    systemImageName: "cloud.fill",
                    ratingText: "⭐️⭐️⭐️⭐️ 8.9/10"
                ),
                FavoriteItem(
                    title: "Distributed Systems",
                    subtitle: "Advanced CS",
                    detailDescription: """
Consensus algorithms, replicas, and fault injection labs define this course. You implement Raft, debug partitions, and learn why clocks can't be trusted. Reading classic papers each week sharpens technical writing. It's challenging but makes large-scale systems feel approachable.
""",
                    review: "After finishing the replication lab, I finally understood the magic behind databases that never seem to go down. Easily the toughest class I loved.",
                    systemImageName: "rectangle.3.group.fill",
                    ratingText: "⭐️⭐️⭐️⭐️⭐️ 9.4/10"
                )
            ]
        }
    }
}

