function CraftJson-Pickaxe {


$contenu = '{
    "type": "minecraft:crafting_shaped",
    "pattern": [
    "###",
    " * ",
    " * "
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
        "item": "'+ $args[1] +'_pickaxe"
    }
}'


    return $contenu


}