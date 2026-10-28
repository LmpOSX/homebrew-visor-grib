cask "visor-grib" do
  version "0.7.0"
  sha256 "f8c474e09c965e19193fb3b6f534ffe001d62abd8fafd7324b07bcb126536467"

  url "https://github.com/LmpOSX/GRIB/releases/download/v#{version}/Visor_GRIB_#{version}_macOS_arm64.dmg"
  name "Visor GRIB"
  desc "Visor de GRIB2 de viento y temperatura por Nivel de Vuelo (WAFS)"
  homepage "https://github.com/LmpOSX/GRIB"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Visor GRIB.app"

  # Firma ad hoc (sin certificado de Apple): sin la marca de cuarentena macOS
  # no la bloquea la primera vez
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Visor GRIB.app"],
        must_succeed:   false,
        writable_paths: ["{{appdir}}/Visor GRIB.app"]
  end

  zap trash: [
    "~/Library/Application Support/Visor GRIB",
    "~/Library/Caches/Visor GRIB",
    "~/Library/Preferences/com.visorgrib.app.plist",
    "~/Library/Saved Application State/com.visorgrib.app.savedState",
  ]
end
