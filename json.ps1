echo "Start Script Create JSON"

echo "--------------------------------------------------------------------------"

#Recup Path Forge
$path = Read-Host "the path of 'Forge' | default : C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\"
if ($path -eq "") {
  $path = "C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\"
}

#Recup ModID Forge
$modid = Read-Host "it's MOD_ID | default : tyromod"
if ($modid -eq "") {
  $modid = "tyromod"
}

echo "--------------------------------------------------------------------------"

$isAll = Read-Host "Mode ? ONE or ALL | default : ALL"
if ($isAll -eq "") {
  $isAll = "ALL"
}

if ($isAll -eq "ONE"){

#Recup Type
$type = Read-Host "it's BLOCK or ITEM or TOOL or ONETOOL or ARMOR  | default : ITEM"
if ($type -eq "") {
  $type = "ITEM"
}

#Si TYPE okay
if (($type -eq "ITEM") -or ($type -eq "BLOCK") -or ($type -eq "TOOL") -or ($type -eq "armor")) {

  #Name du Type
  $name = Read-Host "the NAME of the" $type;

  if (($type -eq "ITEM") -or ($type -eq "ONETOOL")){

    #url de création
    $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + ".json"

    #Create File
    #Out-File $link

    #Line "Layer0"
    $tempLayer = $modid + ":items/" + $name

    #Line "Parent"
    if (($type -eq "ONETOOL")){
      $tempParent = "item/handheld"
    } else {
      $tempParent = "item/generated"
    }

    #JSONContenu
    $itemJSON = @"
{
  "parent": "$tempParent",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
    [System.IO.File]::WriteAllBytes($link, $bytes)

  }

  if ($type -eq "ARMOR"){

    $armorsType = @("helmet", "chestplate", "leggings", "boots")

    # Boucle pour afficher chaque chaîne de caractères une par une
    foreach ($oneType in $armorsType) {
        $link = ""
        $tempLayer = ""
        $itemJSON = ""

         #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_"+ $oneType +".json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_"+ $oneType

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

  }

  if ($type -eq "TOOL"){

    $toolType = @("sword", "pickaxe", "axe", "shovel", "hoe")

    # Boucle pour afficher chaque chaîne de caractères une par une
    foreach ($oneType in $toolType) {
        $link = ""
        $tempLayer = ""
        $itemJSON = ""

         #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_"+ $oneType +".json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_"+ $oneType

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/handheld",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

  }


  if ($type -eq "BLOCK"){


                                  ### FILE ITEM
    #url de création
    $link_ITEM = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + ".json"

    #Line "Parent"
    $tempParent_ITEM = $modid + ":block/" + $name

    #JSONContenu
    $itemJSON_ITEM = @"
{
  "parent": "$tempParent_ITEM"
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_ITEM)
    [System.IO.File]::WriteAllBytes($link_ITEM, $bytes)




                                  ### FILE BLOCKSTATES
    #url de création
    $link_BS = $path +"src\main\resources\assets\"+$modid+"\blockstates\"+ $name + ".json"

    #Line "Model"
    $tempModel_BS = $modid + ":" + $name

    #JSONContenu
    $itemJSON_BS = @"
{
  "variants": {
    "normal": { "model": "$tempModel_BS" }
  }
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_BS)
    [System.IO.File]::WriteAllBytes($link_BS, $bytes)






                                  ### FILE BLOCK
    #url de création
    $link_B = $path +"src\main\resources\assets\"+$modid+"\models\block\"+ $name + ".json"

    #Line "All"
    $tempAll_B = $modid + ":blocks/" + $name

    #JSONContenu
    $itemJSON_B = @"
{
  "parent": "block/cube_all",
  "textures": {
    "all": "$tempAll_B"
  }
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_B)
    [System.IO.File]::WriteAllBytes($link_B, $bytes)






#                                    ### FILE LOOT
#
#     #url de création
#     $link_l = $path +"src\main\resources\data\"+$modid+"\loot_tables\block\"+ $name + ".json"
#
#     #Create File
#     Out-File $link_l
#
#     #Line "Name"
#     $tempName_l = $modid + ":" + $name
#
#     #JSONContenu
#     $itemJSON_l = @"
#  {
#   "type": "minecraft:block",
#   "pools": [
#     {
#       "rolls": 1,
#       "entries": [
#         {
#           "type": "minecraft:item",
#           "name": "$tempName_l"
#         }
#       ],
#       "conditions": [
#         {
#           "condition": "minecraft:survives_explosion"
#         }
#       ]
#     }
#   ]
# }
# "@
#     #Add contenue file
#     ADD-content -path $link_l -value $itemJSON_l

  }


} else {
  echo "ERREUR"
}

} else {

    #Name du Type
    $name = Read-Host "the NAME of your ORE";

    ####################################### ITEM BASE

    echo "created Tools";
    $toolType = @("sword", "pickaxe", "axe", "shovel", "hoe")

    foreach ($oneType in $toolType) {
        $link = ""
        $tempLayer = ""
        $itemJSON = ""

         #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_"+ $oneType +".json"

        $tempLayer = $modid + ":items/" + $name + "_"+ $oneType

        $itemJSON = @"
{
  "parent": "item/handheld",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

   }

    echo "created Armor";
    $armorsType = @("helmet", "chestplate", "leggings", "boots")

    foreach ($oneType in $armorsType) {
        $link = ""
        $tempLayer = ""
        $itemJSON = ""

        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_"+ $oneType +".json"

        $tempLayer = $modid + ":items/" + $name + "_"+ $oneType

        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@

        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    ####################################### BLOCK BASE

    echo "created Block";
                                  ### FILE ITEM
    #url de création
    $link_ITEM = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_block.json"

    #Line "Parent"
    $tempParent_ITEM = $modid + ":block/" + $name + "_block"

    #JSONContenu
    $itemJSON_ITEM = @"
{
  "parent": "$tempParent_ITEM"
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_ITEM)
    [System.IO.File]::WriteAllBytes($link_ITEM, $bytes)




                                  ### FILE BLOCKSTATES
    #url de création
    $link_BS = $path +"src\main\resources\assets\"+$modid+"\blockstates\"+ $name + "_block.json"

    #Line "Model"
    $tempModel_BS = $modid + ":" + $name + "_block"

    #JSONContenu
    $itemJSON_BS = @"
{
  "variants": {
    "normal": { "model": "$tempModel_BS" }
  }
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_BS)
    [System.IO.File]::WriteAllBytes($link_BS, $bytes)


                                  ### FILE BLOCK
    #url de création
    $link_B = $path +"src\main\resources\assets\"+$modid+"\models\block\"+ $name + "_block.json"

    #Line "All"
    $tempAll_B = $modid + ":blocks/" + $name + "_block"

    #JSONContenu
    $itemJSON_B = @"
{
  "parent": "block/cube_all",
  "textures": {
    "all": "$tempAll_B"
  }
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_B)
    [System.IO.File]::WriteAllBytes($link_B, $bytes)


    ####################################### QUESTION

    $isClassic = Read-Host "is there a CLASSIC item | default : YES";
    if ($isClassic -eq "") { $isClassic = "YES" }

    if (($isClassic -eq "YES") -or ($isClassic -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + ".json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    $isIngot = Read-Host "is there a INGOT item | default : NO";
    if ($isIngot -eq "") { $isIngot = "NO" }

    if (($isIngot -eq "YES") -or ($isIngot -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_ingot.json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_ingot"

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    $isNugget = Read-Host "is there a NUGGET item | default : NO";
    if ($isNugget -eq "") { $isNugget = "NO" }

    if (($isNugget -eq "YES") -or ($isNugget -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_nugget.json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_nugget"

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    $isGem = Read-Host "is there a GEM item | default : NO";
    if ($isGem -eq "") { $isGem = "NO" }

    if (($isGem -eq "YES") -or ($isGem -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_gem.json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_gem"

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    $isPowder = Read-Host "is there a POWDER item | default : NO";
    if ($isPowder -eq "") { $isPowder = "NO" }

    if (($isPowder -eq "YES") -or ($isPowder -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_powder.json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_powder"

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/generated",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }


    $isStick = Read-Host "is there a STICK item | default : NO";
    if ($isStick -eq "") { $isStick = "NO" }


    if (($isStick -eq "YES") -or ($isStick -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_stick.json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_stick"

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/handheld",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    $isHammer = Read-Host "is there a HAMMER item | default : NO";
    if ($isHammer -eq "") { $isHammer = "NO" }

    if (($isHammer -eq "YES") -or ($isHammer -eq "Y")) {

        #url de création
        $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_hammer.json"

        #Line "Layer0"
        $tempLayer = $modid + ":items/" + $name + "_hammer"

        #JSONContenu
        $itemJSON = @"
{
  "parent": "item/handheld",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON)
        [System.IO.File]::WriteAllBytes($link, $bytes)

    }

    $isOreBlock = Read-Host "is there a ORE block | default : NO";
    if ($isOreBlock -eq "") { $isOreBlock = "NO" }


    if (($isOreBlock -eq "YES") -or ($isOreBlock -eq "Y")) {


    #url de création
    $link_ITEM = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + "_ore.json"

    #Line "Parent"
    $tempParent_ITEM = $modid + ":block/" + $name + "_ore"

    #JSONContenu
    $itemJSON_ITEM = @"
{
  "parent": "$tempParent_ITEM"
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_ITEM)
    [System.IO.File]::WriteAllBytes($link_ITEM, $bytes)




                                  ### FILE BLOCKSTATES
    #url de création
    $link_BS = $path +"src\main\resources\assets\"+$modid+"\blockstates\"+ $name + "_ore.json"

    #Line "Model"
    $tempModel_BS = $modid + ":" + $name + "_ore"

    #JSONContenu
    $itemJSON_BS = @"
{
  "variants": {
    "normal": { "model": "$tempModel_BS" }
  }
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_BS)
    [System.IO.File]::WriteAllBytes($link_BS, $bytes)


                                  ### FILE BLOCK
    #url de création
    $link_B = $path +"src\main\resources\assets\"+$modid+"\models\block\"+ $name + "_ore.json"

    #Line "All"
    $tempAll_B = $modid + ":blocks/" + $name + "_ore"

    #JSONContenu
    $itemJSON_B = @"
{
  "parent": "block/cube_all",
  "textures": {
    "all": "$tempAll_B"
  }
}
"@
    #Add contenue file
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($itemJSON_B)
    [System.IO.File]::WriteAllBytes($link_B, $bytes)




    }








}