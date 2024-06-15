Function GenerateCraftBlock($name, $type, $modid, $forgeUrl){
    echo "CRAFT A REALISER DE '$name' de type '$type'"

    if ($type -eq "block")
    {
        $linkClassic = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"1.json"
        $linkIngot = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"2.json"
        $linkGem = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"3.json"

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

        $linkClassicDeCraft = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"_decraft1.json"
        $linkIngotDeCraft = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"_decraft2.json"
        $linkGemDeCraft = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"_decraft3.json"

        $blockJSONClassicDeCraft = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "#"
    ],
    "key": {
        "#": {
            "item": "$tempResultCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempBesoinCraft",
        "count": 9,
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONClassicDeCraft)
        [System.IO.File]::WriteAllBytes($linkClassicDeCraft, $bytes)

        $blockJSONIngotDeCraft = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "#"
    ],
    "key": {
        "#": {
            "item": "$tempResultCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempBesoinCraftIngot",
        "count": 9,
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONIngotDeCraft)
        [System.IO.File]::WriteAllBytes($linkIngotDeCraft, $bytes)

        $blockJSONGemDeCraft = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "#"
    ],
    "key": {
        "#": {
            "item": "$tempResultCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempBesoinCraftGem",
        "count": 9,
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONGemDeCraft)
        [System.IO.File]::WriteAllBytes($linkGemDeCraft, $bytes)



    }
















}














Function GenerateCraftItem($name, $type, $modid, $forgeUrl)
{
    echo "CRAFT A REALISER DE '$name' de type '$type'"

    $linkClassic = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"1.json"
    $linkIngot = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"2.json"
    $linkGem = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"3.json"

    if ($type -eq "helmet")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "# #"
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
        "# #"
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
        "# #"
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

    if ($type -eq "chestplate")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "# #",
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
        "# #",
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
        "# #",
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

    if ($type -eq "leggings")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "# #",
        "# #"
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
        "# #",
        "# #"
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
        "# #",
        "# #"
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

    if ($type -eq "boots")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "# #",
        "# #"
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
        "# #",
        "# #"
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
        "# #",
        "# #"
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

    if ($type -eq "nugget")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "#"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempResultCraft",
        "count": 9,
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
        "#"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        }
    },
    "result": {
        "item": "$tempResultCraft",
        "count": 9,
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
        "#"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        }
    },
    "result": {
        "item": "$tempResultCraft",
        "count": 9,
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONGem)
        [System.IO.File]::WriteAllBytes($linkGem, $bytes)

        $linkClassicDeCraft = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"_decraft1.json"
        $linkIngotDeCraft = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"_decraft2.json"
        $linkGemDeCraft = $forgeUrl +"src\main\resources\assets\"+$modid+"\recipes\gen_"+ $name + "_"+ $type +"_decraft3.json"

        $blockJSONClassicDeCraft = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "###",
        "###"
    ],
    "key": {
        "#": {
            "item": "$tempResultCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempBesoinCraft",
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONClassicDeCraft)
        [System.IO.File]::WriteAllBytes($linkClassicDeCraft, $bytes)

        $blockJSONIngotDeCraft = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "###",
        "###"
    ],
    "key": {
        "#": {
            "item": "$tempResultCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempBesoinCraftIngot",
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONIngotDeCraft)
        [System.IO.File]::WriteAllBytes($linkIngotDeCraft, $bytes)

        $blockJSONGemDeCraft = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        "###",
        "###"
    ],
    "key": {
        "#": {
            "item": "$tempResultCraft",
			"data": 0
        }
    },
    "result": {
        "item": "$tempBesoinCraftGem",
		"data": 0
    }
}
"@


        $bytes = [System.Text.Encoding]::UTF8.GetBytes($blockJSONGemDeCraft)
        [System.IO.File]::WriteAllBytes($linkGemDeCraft, $bytes)




    }

    if ($type -eq "sword")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "#",
        "#",
        "/"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "#",
        "#",
        "/"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "#",
        "#",
        "/"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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

    if ($type -eq "pickaxe")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "###",
        " / ",
        " / "
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        " / ",
        " / "
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        " / ",
        " / "
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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

    if ($type -eq "axe")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "##",
        "#/",
        " /"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "##",
        "#/",
        " /"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "##",
        "#/",
        " /"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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

    if ($type -eq "shovel")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "#",
        "/",
        "/"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "#",
        "/",
        "/"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "#",
        "/",
        "/"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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

    if ($type -eq "hoe")
    {

        $tempBesoinCraft = $modid + ":" + $name
        $tempBesoinCraftIngot = $modid + ":" + $name + "_ingot"
        $tempBesoinCraftGem = $modid + ":" + $name + "_gem"

        $tempResultCraft = $modid + ":" + $name + "_"+ $type

        $blockJSONClassic = @"
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "##",
        " /",
        " /"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraft",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "##",
        " /",
        " /"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftIngot",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
        "##",
        " /",
        " /"
    ],
    "key": {
        "#": {
            "item": "$tempBesoinCraftGem",
			"data": 0
        },
        "/": {
            "item": "minecraft:stick",
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
