Import-Module -Name "C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\generatedMineraixInTyroMod\function\craft.psm1"
echo "Start Script Create JSON"

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

$blockoritem = Read-Host "ITEM or BLOCK | default : BLOCK"
if ($blockoritem -eq "") {
    $blockoritem = "BLOCK"
}

if ($blockoritem -eq "BLOCK")
{

    $textFilePath = "C:\Users\mxmto\Developpement\Minecraft\Mod\Forge\TyroModS3_Forge1-12\src\main\java\fr\tyrolium\tyromod\init\BlocksMod.java"
    $startLigne = 29;
    $endLigne = 292;


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
    $endLigne = 1351;


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

