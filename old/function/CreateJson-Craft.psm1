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


#TOOL CLASS
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


#ARMOR CLASS
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












#ITEM
if ($typeCRAFT -eq "NUGGET_DEFAULT")
{


$contenuNugget = '{
  "type": "minecraft:crafting_shapeless",
  "ingredients": [
  {
    "item": "'+$defaultArgs+'"
  }
  ],
  "result": {
    "item": "'+$reponseArgs+'_nugget",
    "count": 9
  }
}'

  $pathNugget = $path + $oreL +"_nugget.json"
  ADD-content -path $pathNugget -value $contenuNugget

$contenuDefaultFromNuggets = '{
  "type": "minecraft:crafting_shaped",
  "group": "'+$defaultArgs+'",
  "pattern": [
    "###",
    "###",
    "###"
  ],
  "key": {
    "#": {
      "item": "'+ $reponseArgs +'_nugget"
    }
  },
  "result": {
    "item": "'+$defaultArgs+'"
  }
}'

  $pathDefaultFromNuggets = $path + $oreDefault +"_from_nuggets.json"
  ADD-content -path $pathDefaultFromNuggets -value $contenuDefaultFromNuggets


}

#BLOCK
if ($typeCRAFT -eq "BLOCK_DEFAULT")
{


$contenuBlock = '{
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "###",
    "###",
    "###"
  ],
  "key": {
    "#": {
      "item": "'+$defaultArgs+'"
    }
  },
  "result": {
    "item": "'+ $reponseArgs +'_block"
  }
}'

  $pathBlock = $path + $oreL +"_block.json"
  ADD-content -path $pathBlock -value $contenuBlock

$contenuDefaultFromBlock = '{
  "type": "minecraft:crafting_shapeless",
  "group": "'+$defaultArgs+'",
  "ingredients": [
    {
      "item": "'+ $reponseArgs +'_block"
    }
  ],
  "result": {
    "item": "'+$defaultArgs+'",
    "count": 9
  }
}'

  $pathDefaultFromBlock = $path + $oreDefault +"_from_"+$oreL+"_block.json"
  ADD-content -path $pathDefaultFromBlock -value $contenuDefaultFromBlock


}











}