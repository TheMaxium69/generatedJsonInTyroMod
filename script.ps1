Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Contenu.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Tool.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Other.psm1"

echo "Start Script Create Ore"
echo "--------------------------------------------------------------------------"
echo "SETUP SCRIPT"
#Recup Path Forge
$path = Read-Host "the path of 'Forge' | default : E:\Minecraft\TyroMod\"
if ($path -eq "") {
  $path = "E:\Minecraft\TyroMod\"
}

#Recup Path Forge
$package = Read-Host "the package of 'Forge' | default : \fr\tyrolium\tyromod\"
if ($package -eq "") {
  $package = "\fr\tyrolium\tyromod\"
}

#Recup ModID Forge
$modid = Read-Host "it's MOD_ID | default : tyromod"
if ($modid -eq "") {
  $modid = "tyromod"
}

$pathJavaFile = $path + "src\main\java" + $package

$pathResourceFile = $path + "src\main\resources\assets\"+$modid+"\models\item\"

echo "--------------------------------------------------------------------------"
#Name Ore
$name = Read-Host "the NAME of your Ore";

# Lower
$nameL = $name.toLower()

# Maj
$nameM = $name.toUpper()

# First Maj
$nameF = (Get-Culture).textinfo.totitlecase($nameL)

# echo $nameM + " / " + $nameL + " / " + $nameF


# ------------------

# OreDefault
$contenuDef = Add-Contenu $nameF $nameL
$linkDef = $pathJavaFile + "item\" + $nameF + ".java"
ADD-content -path $linkDef -value $contenuDef

#Ore to a Nugget
$isNugget = Read-Host "The ore to a Nugget? YES or NO | default: NO"
if ($isNugget -eq "") {
  $isNugget = "NO"
}

if ($isNugget -eq "YES") {
    # OreNugget
    $contenuNugget = Add-Other $nameL "Nugget"
    $linkNugget = $pathJavaFile + "item\" + $nameF + "Nugget" + ".java"
    ADD-content -path $linkNugget -value $contenuNugget
}

# OreSword
$contenuSword = Add-Tool $nameL "Sword"
$linkSword = $pathJavaFile + "item\" + $nameF + "Sword" + ".java"
ADD-content -path $linkSword -value $contenuSword

# OrePickaxe
$contenuPickaxe = Add-Tool $nameL "Pickaxe"
$linkPickaxe = $pathJavaFile + "item\" + $nameF + "Pickaxe" + ".java"
ADD-content -path $linkPickaxe -value $contenuPickaxe

# OreAxe
$contenuAxe = Add-Tool $nameL "Axe"
$linkAxe = $pathJavaFile + "item\" + $nameF + "Axe" + ".java"
ADD-content -path $linkAxe -value $contenuAxe

# OreShovel
$contenuShovel = Add-Tool $nameL "Shovel"
$linkShovel = $pathJavaFile + "item\" + $nameF + "Shovel" + ".java"
ADD-content -path $linkShovel -value $contenuShovel

# OreHoe
$contenuHoe = Add-Tool $nameL "Hoe"
$linkHoe = $pathJavaFile + "item\" + $nameF + "Hoe" + ".java"
ADD-content -path $linkHoe -value $contenuHoe

#Ore to a Hammer
$isHammer = Read-Host "The ore to a Hammer? YES or NO | default : NO"
if ($isHammer -eq "") {
  $isHammer = "NO"
}

if ($isHammer -eq "YES") {
    # OreHammer
    $contenuHammer = Add-Tool $nameL "Hammer"
    $linkHammer = $pathJavaFile + "item\" + $nameF + "Hammer" + ".java"
    ADD-content -path $linkHammer -value $contenuHammer
}


