function CreateJson-Lang {

# PATH
    $pathLangFile = $args[1]
    $pathLangFileUS = $pathLangFile + "en_us.json"
    $pathLangFileFR = $pathLangFile + "fr_fr.json"

# ORE
    # Lower
    $oreL = $args[0].toLower()

    # Maj
    $oreM = $args[0].toUpper()

    # First Maj
    $oreF = (Get-Culture).textinfo.totitlecase($oreL)

# Info

    $TypeOre = $args[7]
    $TierOre = $args[2]
    $VersionOre = $args[3]

# LANG

    $addDefault = $args[4]
    $addEN = $args[5]
    $addFR = $args[6]


$contenuJsonEN = '
"'+ $TypeOre +'.tyromod.'+ $oreL + $addDefault +'": "'+ $oreF +' '+ $addEN +'",
"tooltip.tyromod.'+ $oreL + $addDefault +'": "§7Fusion: '+ $TierOre +'",
"tooltip.tyromod.'+ $oreL + $addDefault +'_shift": "§fFusion: '+ $TierOre +' §f, Version: '+ $VersionOre +'",'

    ADD-content -path $pathLangFileUS -value $contenuJsonEN

if ($addFR -eq ""){

$contenuJsonFR = '
"'+ $TypeOre +'.tyromod.'+ $oreL + $addDefault +'": "'+ $oreF +'",
"tooltip.tyromod.'+ $oreL + $addDefault +'": "§7Fusion: '+ $TierOre +'",
"tooltip.tyromod.'+ $oreL + $addDefault +'_shift": "§fFusion: '+ $TierOre +' §f, Version: '+ $VersionOre +'",'

} else {

$contenuJsonFR = '
"'+ $TypeOre +'.tyromod.'+ $oreL + $addDefault +'": "'+ $addFR +' '+ $oreF +'",
"tooltip.tyromod.'+ $oreL + $addDefault +'": "§7Fusion: '+ $TierOre +'",
"tooltip.tyromod.'+ $oreL + $addDefault +'_shift": "§fFusion: '+ $TierOre +' §f, Version: '+ $VersionOre +'",'

}

    ADD-content -path $pathLangFileFR -value $contenuJsonFR



return $contenuJson


}