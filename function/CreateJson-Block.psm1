function CreateJson-Block {


    $path = $args[0]
    $modid = $args[1]
    $name = $args[2]

# assets/tyromod/models/item

    $pathItem = $path + "assets\"+$modid+"\models\item\" + $name + ".json"

    $contenuJsonItem = '{
  "parent": "tyromod:block/'+$name+'"
}'

    ADD-content -path $pathItem -value $contenuJsonItem

# assets/tyromod/models/block

    $pathBlock = $path + "assets\"+$modid+"\models\block\" + $name + ".json"

    $contenuJsonBlock = '{
  "parent": "block/cube_all",
  "textures": {
    "all": "tyromod:block/'+$name+'"
  }
}'

    ADD-content -path $pathBlock -value $contenuJsonBlock


# assets/tyromod/blockstates

    $pathStates = $path + "assets\"+$modid+"\blockstates\" + $name + ".json"

    $contenuJsonStates = '{
  "variants": {
    "": {
      "model": "tyromod:block/'+$name+'"
    }
  }
}'

    ADD-content -path $pathStates -value $contenuJsonStates


# data/tyromod/loot_block/block

    $pathLoot = $path + "data\"+$modid+"\loot_tables\block\" + $name + ".json"

    $contenuJsonLoot = ' {
  "type": "minecraft:block",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "tyromod:'+$name+'"
        }
      ],
      "conditions": [
        {
          "condition": "minecraft:survives_explosion"
        }
      ]
    }
  ]
}'

    ADD-content -path $pathLoot -value $contenuJsonLoot





}