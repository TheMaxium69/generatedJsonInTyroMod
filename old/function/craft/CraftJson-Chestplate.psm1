function CraftJson-Chestplate {


$contenu = '{
    "type": "minecraft:crafting_shaped",
    "pattern": [
    "# #",
    "###",
    "###"
    ],
    "key": {
        "#": {
            "item": "'+ $args[0] +'"
        }
    },
    "result": {
        "item": "'+ $args[1] +'_chestplate"
    }
}'


    return $contenu


}