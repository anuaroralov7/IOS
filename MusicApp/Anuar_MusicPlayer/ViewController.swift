//
//  ViewController.swift
//  Anuar_MusicPlayer
//
//  Created by Anuar Oralov on 06.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Model
    struct Track {
        let title: String
        let audioBaseName: String
        let coverBaseName: String
        let coverExtension: String
    }

    private var tracks: [Track] = []
    private var currentIndex: Int = 0
    private var audioPlayer: AVAudioPlayer?
    private var progressTimer: Timer?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonsAppearance()
        configureAudioSession()
        configureTracks()
        loadTrack(at: currentIndex)
    }

    // MARK: - Configuration
    private func configureButtonsAppearance() {
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold)
        previousButton.setImage(UIImage(systemName: "backward.fill", withConfiguration: config), for: .normal)
        nextButton.setImage(UIImage(systemName: "forward.fill", withConfiguration: config), for: .normal)
        playPauseButton.setImage(UIImage(systemName: "play.fill", withConfiguration: config), for: .normal)
        [previousButton, playPauseButton, nextButton].forEach { $0?.tintColor = .label }
        progressSlider.minimumValue = 0
        progressSlider.maximumValue = 1
        progressSlider.value = 0
    }

    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session error: \(error)")
        }
    }

    private func configureTracks() {
        // Tracks with fixed cover assignments
        tracks = [
            Track(title: "Asphalt 8",
                  audioBaseName: "Macan - Asphalt 8",
                  coverBaseName: "639df041c9120",
                  coverExtension: "jpg"),
            Track(title: "За Всех",
                  audioBaseName: "Macan - За Всех",
                  coverBaseName: "669a799ec8d0c",
                  coverExtension: "jpeg"),
            Track(title: "Кино",
                  audioBaseName: "Macan - Кино",
                  coverBaseName: "68796eb50f67e",
                  coverExtension: "jpeg"),
            Track(title: "Се Ля Ви",
                  audioBaseName: "Macan - Се Ля Ви",
                  coverBaseName: "hEAwXFUnDFw6YF-HoWbBHps40UdrbCvGc8-_SCnIf5dhiFlEw6vHhayObF2HHi7ZTZxTMmWg",
                  coverExtension: "jpg"),
            Track(title: "Memories",
                  audioBaseName: "Xcho & Macan - Memories",
                  coverBaseName: "1",
                  coverExtension: "webp")
        ]
    }

    // MARK: - Loading & UI
    private func loadTrack(at index: Int) {
        guard tracks.indices.contains(index) else { return }
        currentIndex = index
        let track = tracks[index]

        titleLabel.text = track.title

        // Try loading from Resources/Images first, then fallback to root
        var coverPath: String?
        if let path = Bundle.main.path(forResource: track.coverBaseName, ofType: track.coverExtension, inDirectory: "Resources/Images") {
            coverPath = path
        } else if let path = Bundle.main.path(forResource: track.coverBaseName, ofType: track.coverExtension) {
            coverPath = path
        }
        
        if let path = coverPath, let image = UIImage(contentsOfFile: path) {
            coverImageView.image = image
        } else {
            coverImageView.image = UIImage(systemName: "music.note")
            coverImageView.tintColor = .secondaryLabel
        }

        // Try loading from Resources/Audio first, then fallback to root
        var audioURL: URL?
        if let url = Bundle.main.url(forResource: track.audioBaseName, withExtension: "mp3", subdirectory: "Resources/Audio") {
            audioURL = url
        } else if let url = Bundle.main.url(forResource: track.audioBaseName, withExtension: "mp3") {
            audioURL = url
        }
        
        if let url = audioURL {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self
                audioPlayer?.prepareToPlay()
                progressSlider.minimumValue = 0
                progressSlider.maximumValue = Float(audioPlayer?.duration ?? 1)
                progressSlider.value = 0
                currentTimeLabel.text = formatTime(0)
                durationLabel.text = formatTime(audioPlayer?.duration ?? 0)
                updatePlayPauseButton()
            } catch {
                print("Player init error: \(error)")
            }
        }
    }

    private func updatePlayPauseButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .bold)
        let isPlaying = audioPlayer?.isPlaying == true
        let name = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: name, withConfiguration: config), for: .normal)
    }

    private func startTimer() {
        stopTimer()
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: { [weak self] _ in
            self?.updateProgressUI()
        })
    }

    private func stopTimer() {
        progressTimer?.invalidate()
        progressTimer = nil
    }

    private func updateProgressUI() {
        guard let player = audioPlayer else { return }
        progressSlider.value = Float(player.currentTime)
        currentTimeLabel.text = formatTime(player.currentTime)
    }

    private func formatTime(_ seconds: TimeInterval) -> String {
        guard seconds.isFinite && !seconds.isNaN else { return "0:00" }
        let total = Int(seconds)
        let m = total / 60
        let s = total % 60
        return String(format: "%d:%02d", m, s)
    }

    // MARK: - Actions
    @IBAction func didTapPrevious(_ sender: UIButton) {
        guard !tracks.isEmpty else { return }
        let shouldResume = audioPlayer?.isPlaying == true
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        loadTrack(at: currentIndex)
        if shouldResume { audioPlayer?.play(); startTimer() } else { stopTimer() }
        updatePlayPauseButton()
    }

    @IBAction func didTapPlayPause(_ sender: UIButton) {
        guard let player = audioPlayer else { return }
        if player.isPlaying { player.pause(); stopTimer() } else { player.play(); startTimer() }
        updatePlayPauseButton()
    }

    @IBAction func didTapNext(_ sender: UIButton) {
        guard !tracks.isEmpty else { return }
        let shouldResume = audioPlayer?.isPlaying == true
        currentIndex = (currentIndex + 1) % tracks.count
        loadTrack(at: currentIndex)
        if shouldResume { audioPlayer?.play(); startTimer() } else { stopTimer() }
        updatePlayPauseButton()
    }

    @IBAction func progressSliderChanged(_ sender: UISlider) {
        guard let player = audioPlayer else { return }
        player.currentTime = TimeInterval(sender.value)
        updateProgressUI()
    }
}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Auto-advance to next track for a smoother demo
        currentIndex = (currentIndex + 1) % tracks.count
        loadTrack(at: currentIndex)
        audioPlayer?.play()
        startTimer()
        updatePlayPauseButton()
    }
}
