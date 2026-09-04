import Foundation

public struct MusicAnalysis: Sendable, Equatable {
    public let bpm: Double
    public let musicalKey: String
    public let tempoConfidence: Double
    public let keyConfidence: Double

    public init(
        bpm: Double,
        musicalKey: String,
        tempoConfidence: Double,
        keyConfidence: Double
    ) {
        self.bpm = bpm
        self.musicalKey = musicalKey
        self.tempoConfidence = tempoConfidence
        self.keyConfidence = keyConfidence
    }
}

public enum MusicUtilityError: LocalizedError {
    case invalidYouTubeURL
    case missingTool(String)
    case processFailed(tool: String, message: String)
    case downloadDidNotProduceFile
    case unsupportedAudioFormat
    case audioTooShort

    public var errorDescription: String? {
        switch self {
        case .invalidYouTubeURL:
            return "Enter a valid youtube.com or youtu.be URL."
        case .missingTool(let tool):
            return "Could not find \(tool). Install it with Homebrew, then reopen the app."
        case .processFailed(let tool, let message):
            return "\(tool) failed: \(message)"
        case .downloadDidNotProduceFile:
            return "The download finished, but the MP3 path could not be found."
        case .unsupportedAudioFormat:
            return "The downloaded audio could not be decoded."
        case .audioTooShort:
            return "The audio is too short to estimate its tempo and key."
        }
    }
}
