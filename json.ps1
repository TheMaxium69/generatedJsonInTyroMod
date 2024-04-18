echo "Start Script Create JSON"

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

#Recup Type
$type = Read-Host "it's BLOCK or ITEM or TOOL or ARMOR | default : ITEM"
if ($type -eq "") {
  $type = "ITEM"
}

#Si TYPE okay
if (($type -eq "ITEM") -or ($type -eq "BLOCK") -or ($type -eq "TOOL") -or ($type -eq "armor")) {

  #Name du Type
  $name = Read-Host "the NAME of the" $type;

  if (($type -eq "ITEM") -or ($type -eq "TOOL")){

    #url de création
    $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + ".json"

    #Create File
    #Out-File $link

    #Line "Layer0"
    $tempLayer = $modid + ":items/" + $name

    #Line "Parent"
    if (($type -eq "TOOL")){
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