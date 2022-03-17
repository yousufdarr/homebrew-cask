cask "ableton-live-trial" do
  arch = MacOS.version >= :mojave ? "universal" : "intel"
  version "11.1.1"

  if MacOS.version >= :mojave
    sha256 "23d02781a74afcf6cf4fea1796c01548f8eab8a0b66a2e4df88dacbd345eb677"
  else
    sha256 "3712379f7e1d8ef163cbc3d6e31564046584a01f117b529552b93bc104f6be4f"
  end

  url "https://cdn-downloads.ableton.com/channels/#{version}/ableton_live_trial_#{version}_#{arch}.dmg"
  name "Ableton Live Trial"
  desc "Sound and music editor"
  homepage "https://www.ableton.com/en/live/"

  livecheck do
    url "https://www.ableton.com/en/release-notes/live-#{version.major}/"
    regex(/(\d+(?:\.\d+)+)\s*Release\s*Notes/i)
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ableton Live #{version.major} Trial.app"

  uninstall quit: "com.ableton.live"

  zap trash: [
    "/Library/Logs/DiagnosticReports/Max_*.*_resource.diag",
    "~/Library/Application Support/CrashReporter/Ableton *_*.plist",
    "~/Library/Application Support/CrashReporter/Live_*.plist",
    "~/Library/Application Support/CrashReporter/Max_*.plist",
    "~/Library/Application Support/Ableton",
    "~/Library/Application Support/Cycling '74",
    "~/Library/Caches/Ableton",
    "~/Library/Preferences/Ableton",
    "~/Library/Preferences/com.ableton.live.plist*",
    "~/Library/Preferences/com.cycling74.Max*.plist*",
    "~/Music/Ableton",
    "~/Documents/Max [0-9]",
    "/Users/Shared/Max [0-9]",
  ]
end
