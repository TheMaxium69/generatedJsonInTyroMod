function CraftJson-Hoe {


$contenu = '{
    "type": "minecraft:crafting_shaped",
    "pattern": [
    "##",
    " *",
    " *"
    ],
    "key": {
        "#": {
            "item": "'+ $args[0] +'"
        },
        "*": {
            "item": "minecraft:stick"
        }
    },
    "result": {
        "item": "'+ $args[1] +'_hoe"
    }
}'


    return $contenu


}