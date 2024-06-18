Function GenerateLangBlock($name, $type, $modid, $forgeUrl){
    echo "--------------------- LANG A REALISER DE '$name' de type '$type'"
    $linkFR = $forgeUrl +"src\main\resources\assets\"+$modid+"\lang\fr_fr.lang";
    $linkEN = $forgeUrl +"src\main\resources\assets\"+$modid+"\lang\en_us.lang";

    if ($type -eq "classic")
    {
        $nameLang = $name -replace "_", " "
        $nameFR = tradFrench $name;
        $nameEN = $nameLang.Substring(0, 1).ToUpper() + $nameLang.Substring(1).ToLower()

        $ligneFR = "tile." + $name + ".name=" + $nameFR;
        $ligneEN = "tile." + $name + ".name=" + $nameEN;

    } else {

        $nameLang = $name -replace "_", " "
        $typeLang = $type -replace "_", " "
        $tradTypeFR = tradFrench $type;
        $tradNameFR = tradFrench $nameLang;

        $nameFR = ($tradTypeFR + " " + $tradNameFR.Substring(0, 1).ToUpper() + $tradNameFR.Substring(1).ToLower());
        $nameEN = ($nameLang.Substring(0, 1).ToUpper() + $nameLang.Substring(1).ToLower() + " " + $typeLang.Substring(0, 1).ToUpper() + $typeLang.Substring(1).ToLower());

        $ligneFR = "tile." + $name + "_" + $type  +".name=" + $nameFR;
        $ligneEN = "tile." + $name + "_" + $type  +".name=" + $nameEN;

    }



    echo $ligneEN
    echo $ligneFR
    echo "";

    $ligneFR | Out-File -FilePath $linkFR -Encoding UTF8 -Append
    $ligneEN | Out-File -FilePath $linkEN -Encoding UTF8 -Append

}














Function GenerateLangItem($name, $type, $modid, $forgeUrl)
{
    echo "--------------------- LANG A REALISER DE '$name' de type '$type'"
    $linkFR = $forgeUrl +"src\main\resources\assets\"+$modid+"\lang\fr_fr.lang";
    $linkEN = $forgeUrl +"src\main\resources\assets\"+$modid+"\lang\en_us.lang";

    if ($type -eq "classic")
    {
        $nameLang = $name -replace "_", " "
        $tradNameFR = tradFrench $name;
        $nameFR = $tradNameFR.Substring(0, 1).ToUpper() + $tradNameFR.Substring(1).ToLower();
        $nameEN = $nameLang.Substring(0, 1).ToUpper() + $nameLang.Substring(1).ToLower()

        $ligneFR = "item." + $name + ".name=" + $nameFR;
        $ligneEN = "item." + $name + ".name=" + $nameEN;

    } else {

        $nameLang = $name -replace "_", " "
        $typeLang = $type -replace "_", " "
        $tradTypeFR = tradFrench $type;
        $tradNameFR = tradFrench $nameLang;

        $nameFR = ($tradTypeFR.Substring(0, 1).ToUpper() + $tradTypeFR.Substring(1).ToLower() + " " + $tradNameFR.Substring(0, 1).ToUpper() + $tradNameFR.Substring(1).ToLower());
        $nameEN = ($nameLang.Substring(0, 1).ToUpper() + $nameLang.Substring(1).ToLower() + " " + $typeLang.Substring(0, 1).ToUpper() + $typeLang.Substring(1).ToLower());

        $ligneFR = "item." + $name + "_" + $type  +".name=" + $nameFR;
        $ligneEN = "item." + $name + "_" + $type  +".name=" + $nameEN;

    }

    echo $ligneEN
    echo $ligneFR
    echo "";


    $ligneFR | Out-File -FilePath $linkFR -Encoding UTF8 -Append
    $ligneEN | Out-File -FilePath $linkEN -Encoding UTF8 -Append


}







function tradFrench($string)
{

#    BLOCK
    if ($string -eq "block")
    {
        $typeFR = "Bloc de";
    }
    elseif ($string -eq "ore")
    {
        $typeFR = "Minerai de";
    }
    elseif ($string -eq "flag")
    {
        $typeFR = "Drapeau de";
    }
    elseif ($string -eq "commande_block")
    {
        $typeFR = "Block de commande en";
    }
    elseif ($string -eq "fusion_block")
    {
        $typeFR = "Bloc de Fusion";
    }
    elseif ($string -eq "elevator_block")
    {
        $typeFR = "Bloc d'Ascenseur";
    }

#   ITEM
    elseif ($string -eq "ingot")
    {
        $typeFR = "Lingot de";
    }
    elseif ($string -eq "gem")
    {
        $typeFR = "Gemme de";
    }
    elseif ($string -eq "nugget")
    {
        $typeFR = "Pepite de";
    }
    elseif ($string -eq "stick")
    {
        $typeFR = "Baton de";
    }
    elseif ($string -eq "sword")
    {
        $typeFR = "Epee en";
    }
    elseif ($string -eq "pickaxe")
    {
        $typeFR = "Pioche en";
    }
    elseif ($string -eq "axe")
    {
        $typeFR = "Hache en";
    }
    elseif ($string -eq "shovel")
    {
        $typeFR = "Pelle en";
    }
    elseif ($string -eq "hoe")
    {
        $typeFR = "Houe en";
    }
    elseif ($string -eq "hammer")
    {
        $typeFR = "Marteau en";
    }
    elseif ($string -eq "helmet")
    {
        $typeFR = "Casque en";
    }
    elseif ($string -eq "chestplate")
    {
        $typeFR = "Plastron en";
    }
    elseif ($string -eq "leggings")
    {
        $typeFR = "Jambieres en";
    }
    elseif ($string -eq "boots")
    {
        $typeFR = "Bottes en";
    }
    elseif ($string -eq "wrench")
    {
        $typeFR = "Cle en";
    }
    else
    {
        $typeFR = $string;
    }

    return $typeFR;

}
