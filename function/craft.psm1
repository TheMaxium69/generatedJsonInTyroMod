Function GenerateCraftBlock($name, $type, $modid, $forgeUrl){
    echo "CRAFT A REALISER DE '$name' de type '$type'"

    if ($type -eq "block")
    {
        $linkClassic = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\"+ $name + "_"+ $type +"1.json"
        $linkIngot = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\"+ $name + "_"+ $type +"2.json"
        $linkGem = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\"+ $name + "_"+ $type +"3.json"

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "###",
        "###"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempResultCraft",
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONClassic)
        [System.IO.File]::WriteAllBytes($linkClassic, $bytes)

        $blockJSONIngot = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "###",
        "###"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        }
    },
    "result": {
        "item": "$tempResultCraft",
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONIngot)
        [System.IO.File]::WriteAllBytes($linkIngot, $bytes)

        $blockJSONGem = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "###",
        "###"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        }
    },
    "result": {
        "item": "$tempResultCraft",
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONGem)
        [System.IO.File]::WriteAllBytes($linkGem, $bytes)



    }
















}














Function GenerateCraftItem($name, $type)
{
    echo "CRAFT A REALISER DE '$name' de type '$type'"
}
