# TOOL DEFAULT
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Sword.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Pickaxe.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Axe.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Shovel.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Hoe.psm1"
#ARMOR DEFAULT
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Helmet.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Chestplate.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Leggings.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\craft\CraftJson-Boots.psm1"


function CreateJson-Craft {

# INFO

    $path = $args[0]
    $typeCRAFT = $args[1]
    $oreDefault = $args[2]
    $oreL = $args[3]

# ARGS

    $defaultArgs = "tyromod:"+$oreDefault
    $reponseArgs = "tyromod:"+$oreL

if ($typeCRAFT -eq "TOOL_DEFAULT")
{

  #Sword
  $pathSword = $path + $oreL +"_sword.json"
  $contenuSword = CraftJson-Sword $defaultArgs $reponseArgs
  ADD-content -path $pathSword -value $contenuSword

  #Pickaxe
  $pathPickaxe = $path + $oreL +"_pickaxe.json"
  $contenuPickaxe = CraftJson-Pickaxe $defaultArgs $reponseArgs
  ADD-content -path $pathPickaxe -value $contenuPickaxe

  #Axe
  $pathAxe = $path + $oreL +"_axe.json"
  $contenuAxe = CraftJson-Axe $defaultArgs $reponseArgs
  ADD-content -path $pathAxe -value $contenuAxe

  #Shovel
  $pathShovel = $path + $oreL +"_shovel.json"
  $contenuShovel = CraftJson-Shovel $defaultArgs $reponseArgs
  ADD-content -path $pathShovel -value $contenuShovel

  #Hoe
  $pathHoe = $path + $oreL +"_hoe.json"
  $contenuHoe = CraftJson-Hoe $defaultArgs $reponseArgs
  ADD-content -path $pathHoe -value $contenuHoe


}

if ($typeCRAFT -eq "ARMOR_DEFAULT")
{

  #Helmet
  $pathHelmet = $path + $oreL +"_helmet.json"
  $contenuHelmet = CraftJson-Helmet $defaultArgs $reponseArgs
  ADD-content -path $pathHelmet -value $contenuHelmet

  #Chestplate
  $pathChestplate = $path + $oreL +"_chestplate.json"
  $contenuChestplate = CraftJson-Chestplate $defaultArgs $reponseArgs
  ADD-content -path $pathChestplate -value $contenuChestplate

  #Leggings
  $pathLeggings = $path + $oreL +"_leggings.json"
  $contenuLeggings = CraftJson-Leggings $defaultArgs $reponseArgs
  ADD-content -path $pathLeggings -value $contenuLeggings

  #Boots
  $pathBoots = $path + $oreL +"_boots.json"
  $contenuBoots = CraftJson-Boots $defaultArgs $reponseArgs
  ADD-content -path $pathBoots -value $contenuBoots

}















}