# Tap de Homebrew: Visor GRIB

Cask para instalar y actualizar el [Visor GRIB](https://github.com/LmpOSX/GRIB)
(visor de GRIB2 de viento y temperatura por Nivel de Vuelo, WAFS) en macOS con
Apple Silicon, desde el DMG de cada release de GitHub.

## Instalación

Homebrew 7 sólo carga casks de taps de terceros marcados como confiables:

```bash
brew tap LmpOSX/visor-grib
brew trust --tap LmpOSX/visor-grib
brew install --cask visor-grib
```

Si el visor ya estaba instalado a mano en `/Applications`, Homebrew puede
adoptarlo en vez de pedir que se borre (misma versión):

```bash
brew install --cask --adopt visor-grib
```

## Actualizar

```bash
brew update
brew upgrade --cask visor-grib     # o simplemente: brew upgrade
```

La configuración (`~/Library/Application Support/Visor GRIB`) y la caché de
descargas no se tocan al actualizar. `brew uninstall --zap visor-grib` borra
también esas carpetas.

## La app no está firmada con un certificado de Apple

El DMG lleva firma ad hoc. El cask le quita la marca de cuarentena al
instalar, así macOS no la bloquea la primera vez; si igual la bloquea:
Ajustes del Sistema ▸ Privacidad y seguridad ▸ Abrir igualmente, o
`xattr -cr "/Applications/Visor GRIB.app"`.

## wgrib2 (opcional)

El visor lee GRIB2 con ecCodes, incluido en la app. Para usar wgrib2 como
motor alternativo o regrillar con `wgrib2 -new_grid`, está el tap aparte
[LmpOSX/wgrib2](https://github.com/LmpOSX/homebrew-wgrib2):

```bash
brew tap LmpOSX/wgrib2 && brew trust --tap LmpOSX/wgrib2 && brew install wgrib2
```

## Nueva versión del visor

En `Casks/visor-grib.rb` se cambian `version` y `sha256`
(`shasum -a 256 Visor_GRIB_X.Y.Z_macOS_arm64.dmg`), commit y push.
