function CraftJson-Leggings {


$contenu = '{
    "type": "minecraft:crafting_shaped",
    "pattern": [
    "###",
    "# #",
    "# #"
    ],
    "key": {
        "#": {
            "item": "'+ $args[0] +'"
        }
    },
    "result": {
        "item": "'+ $args[1] +'_leggings"
    }
}'


    return $contenu


}