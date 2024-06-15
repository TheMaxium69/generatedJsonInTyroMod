function CraftJson-Boots {


$contenu = '{
    "type": "minecraft:crafting_shaped",
    "pattern": [
    "# #",
    "# #"
    ],
    "key": {
        "#": {
            "item": "'+ $args[0] +'"
        }
    },
    "result": {
        "item": "'+ $args[1] +'_boots"
    }
}'


    return $contenu


}