function CraftJson-Helmet {


$contenu = '{
    "type": "minecraft:crafting_shaped",
    "pattern": [
    "###",
    "# #"
    ],
    "key": {
        "#": {
            "item": "'+ $args[0] +'"
        }
    },
    "result": {
        "item": "'+ $args[1] +'_helmet"
    }
}'


    return $contenu


}