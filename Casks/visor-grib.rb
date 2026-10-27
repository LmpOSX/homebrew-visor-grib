cask "visor-grib" do
  version "0.6.1"
  sha256 "aaba526e919a41b0c0eb5ca379ecd0187f1a9fa2f03f6440ca7953a41a1139db"

  url "https://github.com/LmpOSX/GRIB/releases/download/v#{version}/Visor_GRIB_#{version}_macOS_arm64.dmg"
  name "Visor GRIB"
  desc "Visor de GRIB2 de viento y temperatura por Nivel de Vuelo (WAFS)"
  homepage "https://github.com/LmpOSX/GRIB"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Visor GRIB.app"

  # Firma ad hoc (sin certificado de Apple): sin la marca de cuarentena macOS
  # no la bloquea la primera vez
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Visor GRIB.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Visor GRIB",
    "~/Library/Caches/Visor GRIB",
    "~/Library/Preferences/com.visorgrib.app.plist",
    "~/Library/Saved Application State/com.visorgrib.app.savedState",
  ]
end
