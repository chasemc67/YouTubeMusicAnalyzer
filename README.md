# YouTube Music Analyzer

A small native macOS utility that downloads one YouTube video as an MP3 and estimates the song's BPM and musical key.

## Features

- Native SwiftUI interface
- Desktop output by default, with an optional destination picker
- Downloads only the URL you paste, never its surrounding playlist
- High-quality MP3 conversion with embedded metadata and thumbnail
- Local BPM and key analysis—no audio is uploaded to another service
- Finder shortcut after each successful download

## Requirements

- macOS 13 or newer
- Swift 5.9 or newer (included with current Xcode command-line tools)
- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)
- [`ffmpeg`](https://ffmpeg.org/)

Install the command-line dependencies with Homebrew if needed:

```bash
brew install yt-dlp ffmpeg
```

The app also checks `~/.local/bin`, so a pip-installed `yt-dlp` works too.

## Build and run

```bash
./scripts/build-app.sh
open "dist/YouTube Music Analyzer.app"
```

For development:

```bash
swift run YouTubeMusicAnalyzer
swift test
```

To test the analyzer directly against a local audio file:

```bash
swift run MusicAnalyzerCLI "/path/to/song.mp3"
```

## Accuracy

BPM and key detection are estimates. Strong, steady recordings—especially electronic and pop music—usually work best. Tracks with long ambient introductions, live tempo drift, key changes, or intentionally ambiguous harmony may need a musician's final check. Half-time and double-time interpretations (for example, 70 vs. 140 BPM) are musically equivalent pulse readings and occasionally require manual interpretation.

Only download audio you have permission to save and use.
