Import-Module -Name "C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\generatedMineraixInTyroMod\function\craft.psm1"
echo "Start Script Create Craft JSON"

echo "--------------------------------------------------------------------------"

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

echo "--------------------------------------------------------------------------"

$blockoritem = Read-Host "ITEM or BLOCK or OTHER | default : BLOCK"
if ($blockoritem -eq "") {
    $blockoritem = "BLOCK"
}

if ($blockoritem -eq "BLOCK")
{

    $textFilePath = "C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\src\main\java\fr\tyrolium\tyromod\init\BlocksMod.java"
    $startLigne = 29;
    $endLigne = 301;


    $fileContent = Get-Content -Path $textFilePath
    $fileContentLines = $fileContent | Select-Object -Index ($startLigne..$endLigne)

    foreach ($line in $fileContentLines)
    {
        if ( $line.StartsWith("            new BlockGenerateClass("))
        {

            $line = $line.Substring("            new BlockGenerateClass(".Length)
            $matches = [regex]::matches($line, '"([^"]*)"')
            $nameBlock = $matches[0].Groups[1].Value
            $typeBlock = $matches[1].Groups[1].Value

            GenerateCraftBlock $nameBlock $typeBlock $modid $path

        }

    }

}

if ($blockoritem -eq "ITEM")
{

    $textFilePath = "C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\src\main\java\fr\tyrolium\tyromod\init\ItemsMod.java"
    $startLigne = 231;
    $endLigne = 1377;


    $fileContent = Get-Content -Path $textFilePath
    $fileContentLines = $fileContent | Select-Object -Index ($startLigne..$endLigne)

    foreach ($line in $fileContentLines)
    {
        if ( $line.StartsWith("            new ItemGenerateClass("))
        {

            $line = $line.Substring("            new ItemGenerateClass(".Length)
            $matches = [regex]::matches($line, '"([^"]*)"')
            $nameItem = $matches[0].Groups[1].Value
            $typeItem = $matches[1].Groups[1].Value

            GenerateCraftItem $nameItem $typeItem $modid $path

        }

    }


}

if ($blockoritem -eq "OTHER")
{
    echo "Bienvenue dans le mode autre craft !"

    for ($i = 0; $i -lt 20; $i++) {

        $resultatId = $i + 1
        $linkClassic = $path +"src\main\resources\assets\"+$modid+"\recipes\cobblestone\gen_cobblestone_"+ $resultatId +"_compressed.json"
        $tempResultCraft = $modid + ":cobblestone_"+ $resultatId +"_compressed"

        if ($i -eq 0) {
            $tempBesoinCraft = "minecraft:cobblestone"
        } else {
            $tempBesoinCraft = $modid + ":cobblestone_"+ $i +"_compressed"
        }

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

        echo "- Create craft cobblestone_$($resultatId)_compressed"

    }

}

