Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Contenu.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Tool.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Other.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Armor.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Block.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\CreateJson-Item.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\CreateJson-Block.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\CreateJson-Lang.psm1"

# MAIN VARIABLE

$oreItemDefault = "YES"
$toolDefault = "NO"
$armorDefault = "NO"
$tierOreDefault = "IUM"
$versionOreDefault = "1"

# START SCRIPT

echo "Start Script Create Ore"
echo "--------------------------------------------------------------------------"
echo "SETUP SCRIPT"
#Recup Path Forge
$path = Read-Host "the path of 'Forge' | default : E:\Minecraft\TyroMod\"
if ($path -eq "") {
  $path = "E:\Minecraft\TyroMod\"
}

#Recup Path Forge
$package = Read-Host "the package of 'Forge' | default : \fr\tyrolium\tyromod\"
if ($package -eq "") {
  $package = "\fr\tyrolium\tyromod\"
}

#Recup ModID Forge
$modid = Read-Host "it's MOD_ID | default : tyromod"
if ($modid -eq "") {
  $modid = "tyromod"
}

$pathJavaFile = $path + "src\main\java" + $package

$pathResourceFile = $path + "src\main\resources\assets\"+$modid+"\models\item\"

$pathBlockFile = $path + "src\main\resources\"

$pathLangFile = $path + "src\main\resources\assets\"+$modid+"\lang\"


echo "--------------------------------------------------------------------------"
echo "PRINCIPAL INFORMATION"

#Name Ore
$name = Read-Host "the NAME of your Ore";

    # Lower
    $nameL = $name.toLower()

    # Maj
    $nameM = $name.toUpper()

    # First Maj
    $nameF = (Get-Culture).textinfo.totitlecase($nameL)

#Tier Ore
$tierOre = Read-Host "the TIER of your Ore ? IUM OR 1 OR 2 OR 3 | default:"$tierOreDefault
if ($tierOre -eq "") {
    $tierOre = $tierOreDefault
}

    if ($tierOre -eq "IUM") {
        $tierOreFinal = "§1Tier IUM"
    }

    if ($tierOre -eq "1") {
        $tierOreFinal = "§dTier 1"
    }

    if ($tierOre -eq "2") {
        $tierOreFinal = "§9Tier 2"
    }

    if ($tierOre -eq "3") {
        $tierOreFinal = "§4Tier 3"
    }


#Version Ore
$versionOre = Read-Host "the VERSION of your Ore ? 1 OR 3 OR V1 OR V3 OR 13 | default:"$versionOreDefault
if ($versionOre -eq "") {
    $versionOre = $versionOreDefault
}

    if ($versionOre -eq "1") {
        $versionOreFinal = "§cTyroMod V1"
    }

    if ($versionOre -eq "3") {
        $versionOreFinal = "§4TyroMod V3"
    }

    if ($versionOre -eq "V1") {
        $versionOreFinal = "§8Vanilla §f- §cTyroMod V1"
    }

    if ($versionOre -eq "V3") {
        $versionOreFinal = "§8Vanilla §f- §4TyroMod V3"
    }

    if ($versionOre -eq "13") {
        $versionOreFinal = "§cTyroMod V1 §f- §4TyroMod V3"
    }

echo "--------------------------------------------------------------------------"
echo "ITEM ORE"

$contenuModItemsDefault = '
    // ' + $nameF
$contenuModItems = $contenuModItemsDefault

# Ore to an Item
$isItem = Read-Host "It is a ITEM? YES or NO | default:"$oreItemDefault
if ($isItem -eq "") {
    $isItem = $oreItemDefault
}

if ($isItem -eq "YES")
{
    #Ore to an Ingot
    $isIngot = Read-Host "It is a Ingot? YES or NO | default: NO"
    if ($isIngot -eq "")
    {
        $isIngot = "NO"
    }

    if ($isIngot -eq "YES")
    {
        # OreIngot
        $contenuIngot = Add-Other $nameL "Ingot"
        $linkIngot = $pathJavaFile + "item\" + $nameF + "Ingot" + ".java"
        ADD-content -path $linkIngot -value $contenuIngot
        $contenuModItems = $contenuModItems + '
        public static final RegistryObject<Item> ' + $nameM + '_INGOT = ITEMS.register("' + $nameL + '_ingot", () -> new ' + $nameF + 'Ingot());'
        CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_ingot" "Ingot" "L'Ingot de" "item"

        $contenuJsonIngot = CreateJson-Item $nameL"_ingot" "generated"
        $linkJsonIngot = $pathResourceFile + $nameL + "_ingot.json"
        ADD-content -path $linkJsonIngot -value $contenuJsonIngot
    }

    if ($isIngot -eq "NO")
    {
        # OreDefault
        $contenuDef = Add-Contenu $nameF $nameL
        $linkDef = $pathJavaFile + "item\" + $nameF + ".java"
        ADD-content -path $linkDef -value $contenuDef
        $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> ' + $nameM + ' = ITEMS.register("' + $nameL + '", () -> new ' + $nameF + '());'
        CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "" "" "" "item"

        $contenuJsonDef = CreateJson-Item $nameL "generated"
        $linkJsonDef = $pathResourceFile + $nameL + ".json"
        ADD-content -path $linkJsonDef -value $contenuJsonDef

    }
}

#Ore to a Nugget
$isNugget = Read-Host "The ore to a Nugget? YES or NO | default: NO"
if ($isNugget -eq "") {
  $isNugget = "NO"
}

if ($isNugget -eq "YES") {
    # OreNugget
    $contenuNugget = Add-Other $nameL "Nugget"
    $linkNugget = $pathJavaFile + "item\" + $nameF + "Nugget" + ".java"
    ADD-content -path $linkNugget -value $contenuNugget
    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_NUGGET = ITEMS.register("'+ $nameL +'_nugget", () -> new '+ $nameF +'Nugget());'
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_nugget" "Nugget" "Pépite de" "item"

    $contenuJsonNugget = CreateJson-Item $nameL"_nugget" "generated"
    $linkJsonNugget = $pathResourceFile + $nameL + "_nugget.json"
    ADD-content -path $linkJsonNugget -value $contenuJsonNugget
}

#Ore to a Powder
$isPowder = Read-Host "The ore to a Powder? YES or NO | default: NO"
if ($isPowder -eq "") {
    $isPowder = "NO"
}

if ($isPowder -eq "YES") {
    # OrePowder
    $contenuPowder = Add-Other $nameL "Powder"
    $linkPowder = $pathJavaFile + "item\" + $nameF + "Powder" + ".java"
    ADD-content -path $linkPowder -value $contenuPowder
    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_POWDER = ITEMS.register("'+ $nameL +'_powder", () -> new '+ $nameF +'Powder());'
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_powder" "Powder" "Poudre de" "item"

    $contenuJsonPowder = CreateJson-Item $nameL"_powder" "generated"
    $linkJsonPowder = $pathResourceFile + $nameL + "_powder.json"
    ADD-content -path $linkJsonPowder -value $contenuJsonPowder
}

#Ore to a Gem
$isGem = Read-Host "The ore to a Gem? YES or NO | default: NO"
if ($isGem -eq "") {
    $isGem = "NO"
}

if ($isGem -eq "YES") {
    # OreGem
    $contenuGem = Add-Other $nameL "Gem"
    $linkGem = $pathJavaFile + "item\" + $nameF + "Gem" + ".java"
    ADD-content -path $linkGem -value $contenuGem
    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_GEM = ITEMS.register("'+ $nameL +'_gem", () -> new '+ $nameF +'Gem());'
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_gem" "Gem" "Gemme de" "item"

    $contenuJsonGem = CreateJson-Item $nameL"_gem" "generated"
    $linkJsonGem = $pathResourceFile + $nameL + "_gem.json"
    ADD-content -path $linkJsonGem -value $contenuJsonGem
}

#Ore to a Stick
$isStick = Read-Host "The ore to a Stick? YES or NO | default: NO"
if ($isStick -eq "") {
    $isStick = "NO"
}

if ($isStick -eq "YES") {
    # OreStick
    $contenuStick = Add-Other $nameL "Stick"
    $linkStick = $pathJavaFile + "item\" + $nameF + "Stick" + ".java"
    ADD-content -path $linkStick -value $contenuStick
    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_STICK = ITEMS.register("'+ $nameL +'_stick", () -> new '+ $nameF +'Stick());'
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_stick" "Stick" "Bâton en" "item"

    $contenuJsonStick = CreateJson-Item $nameL"_stick" "generated"
    $linkJsonStick = $pathResourceFile + $nameL + "_stick.json"
    ADD-content -path $linkJsonStick -value $contenuJsonStick
}

#Ore to a Tool
$isTool = Read-Host "The ore to a Tool Classic? YES or NO | default:"$toolDefault
if ($isTool -eq "") {
    $isTool = $toolDefault
}

if ($isTool -eq "YES")
{
    # OreSword
    $contenuSword = Add-Tool $nameL "Sword"
    $linkSword = $pathJavaFile + "item\" + $nameF + "Sword" + ".java"
    ADD-content -path $linkSword -value $contenuSword
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_sword" "Sword" "Épée en" "item"

    $contenuJsonSword = CreateJson-Item $nameL"_sword" "handheld"
    $linkJsonSword = $pathResourceFile + $nameL + "_sword.json"
    ADD-content -path $linkJsonSword -value $contenuJsonSword

    # OrePickaxe
    $contenuPickaxe = Add-Tool $nameL "Pickaxe"
    $linkPickaxe = $pathJavaFile + "item\" + $nameF + "Pickaxe" + ".java"
    ADD-content -path $linkPickaxe -value $contenuPickaxe
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_pickaxe" "Pickaxe" "Pioche en" "item"

    $contenuJsonPickaxe = CreateJson-Item $nameL"_pickaxe" "handheld"
    $linkJsonPickaxe = $pathResourceFile + $nameL + "_pickaxe.json"
    ADD-content -path $linkJsonPickaxe -value $contenuJsonPickaxe

    # OreAxe
    $contenuAxe = Add-Tool $nameL "Axe"
    $linkAxe = $pathJavaFile + "item\" + $nameF + "Axe" + ".java"
    ADD-content -path $linkAxe -value $contenuAxe
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_axe" "Axe" "Hache en" "item"

    $contenuJsonAxe = CreateJson-Item $nameL"_axe" "handheld"
    $linkJsonAxe = $pathResourceFile + $nameL + "_axe.json"
    ADD-content -path $linkJsonAxe -value $contenuJsonAxe

    # OreShovel
    $contenuShovel = Add-Tool $nameL "Shovel"
    $linkShovel = $pathJavaFile + "item\" + $nameF + "Shovel" + ".java"
    ADD-content -path $linkShovel -value $contenuShovel
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_shovel" "Shovel" "Pelle en" "item"

    $contenuJsonShovel = CreateJson-Item $nameL"_shovel" "handheld"
    $linkJsonShovel = $pathResourceFile + $nameL + "_shovel.json"
    ADD-content -path $linkJsonShovel -value $contenuJsonShovel

    # OreHoe
    $contenuHoe = Add-Tool $nameL "Hoe"
    $linkHoe = $pathJavaFile + "item\" + $nameF + "Hoe" + ".java"
    ADD-content -path $linkHoe -value $contenuHoe
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_hoe" "Hoe" "Houe en" "item"

    $contenuJsonHoe = CreateJson-Item $nameL"_hoe" "handheld"
    $linkJsonHoe = $pathResourceFile + $nameL + "_hoe.json"
    ADD-content -path $linkJsonHoe -value $contenuJsonHoe

    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_SWORD = ITEMS.register("'+ $nameL +'_sword", () -> new '+ $nameF +'Sword());
    public static final RegistryObject<Item> '+ $nameM +'_PICKAXE = ITEMS.register("'+ $nameL +'_pickaxe", () -> new '+ $nameF +'Pickaxe());
    public static final RegistryObject<Item> '+ $nameM +'_AXE = ITEMS.register("'+ $nameL +'_axe", () -> new '+ $nameF +'Axe());
    public static final RegistryObject<Item> '+ $nameM +'_SHOVEL = ITEMS.register("'+ $nameL +'_shovel", () -> new '+ $nameF +'Shovel());
    public static final RegistryObject<Item> '+ $nameM +'_HOE = ITEMS.register("'+ $nameL +'_hoe", () -> new '+ $nameF +'Hoe());'

    #Ore to a Hammer
    $isHammer = Read-Host "The ore to a Hammer? YES or NO | default : NO"
    if ($isHammer -eq "") {
        $isHammer = "NO"
    }

    if ($isHammer -eq "YES") {
        # OreHammer
        $contenuHammer = Add-Tool $nameL "Hammer"
        $linkHammer = $pathJavaFile + "item\" + $nameF + "Hammer" + ".java"
        ADD-content -path $linkHammer -value $contenuHammer
        $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_HAMMER = ITEMS.register("'+ $nameL +'_hammer", () -> new '+ $nameF +'Hammer());'
        CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_hammer" "Hammer" "Marteau en" "item"

        $contenuJsonHammer = CreateJson-Item $nameL"_hammer" "handheld"
        $linkJsonHammer = $pathResourceFile + $nameL + "_hammer.json"
        ADD-content -path $linkJsonHammer -value $contenuJsonHammer
    }

    #Ore to a SwordFire
    $isSwordFire = Read-Host "The ore to a SwordFire? YES or NO | default : NO"
    if ($isSwordFire -eq "") {
        $isSwordFire = "NO"
    }

    if ($isSwordFire -eq "YES") {
        # OreHammer
        $contenuSwordFire = Add-Tool $nameL "SwordFire"
        $linkSwordFire = $pathJavaFile + "item\" + $nameF + "SwordFire" + ".java"
        ADD-content -path $linkSwordFire -value $contenuSwordFire
        $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_SWORD_FIRE = ITEMS.register("'+ $nameL +'_sword_fire", () -> new '+ $nameF +'SwordFire());'
        CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_sword_fire" "Sword Fire" "Épée Enflammer en" "item"

        $contenuJsonSwordFire = CreateJson-Item $nameL"_sword_fire" "handheld"
        $linkJsonSwordFire = $pathResourceFile + $nameL + "_sword_fire.json"
        ADD-content -path $linkJsonSwordFire -value $contenuJsonSwordFire
    }
}

#Ore to a Armor
$isArmor = Read-Host "The ore to a Armor Classic? YES or NO | default:"$armorDefault
if ($isArmor -eq "") {
    $isArmor = $armorDefault
}

if ($isArmor -eq "YES")
{
    # OreHelmet
    $contenuHelmet = Add-Armor $nameL "Helmet"
    $linkHelmet = $pathJavaFile + "item\" + $nameF + "Helmet" + ".java"
    ADD-content -path $linkHelmet -value $contenuHelmet
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_helmet" "Helmet" "Casque en" "item"

    $contenuJsonHelmet = CreateJson-Item $nameL"_helmet" "handheld"
    $linkJsonHelmet = $pathResourceFile + $nameL + "_helmet.json"
    ADD-content -path $linkJsonHelmet -value $contenuJsonHelmet

    # OreChestplate
    $contenuChestplate = Add-Armor $nameL "Chestplate"
    $linkChestplate = $pathJavaFile + "item\" + $nameF + "Chestplate" + ".java"
    ADD-content -path $linkChestplate -value $contenuChestplate
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_chestplate" "Chestplate" "Plastron en" "item"

    $contenuJsonChestplate = CreateJson-Item $nameL"_chestplate" "handheld"
    $linkJsonChestplate = $pathResourceFile + $nameL + "_chestplate.json"
    ADD-content -path $linkJsonChestplate -value $contenuJsonChestplate

    # OreLeggings
    $contenuLeggings = Add-Armor $nameL "Leggings"
    $linkLeggings = $pathJavaFile + "item\" + $nameF + "Leggings" + ".java"
    ADD-content -path $linkLeggings -value $contenuLeggings
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_leggings" "Leggings" "Jambières en" "item"

    $contenuJsonLeggings = CreateJson-Item $nameL"_leggings" "handheld"
    $linkJsonLeggings = $pathResourceFile + $nameL + "_leggings.json"
    ADD-content -path $linkJsonLeggings -value $contenuJsonLeggings

    # OreBoots
    $contenuBoots = Add-Armor $nameL "Boots"
    $linkBoots = $pathJavaFile + "item\" + $nameF + "Boots" + ".java"
    ADD-content -path $linkBoots -value $contenuBoots
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_boots" "Boots" "Bottes en" "item"

    $contenuJsonBoots = CreateJson-Item $nameL"_boots" "handheld"
    $linkJsonBoots = $pathResourceFile + $nameL + "_boots.json"
    ADD-content -path $linkJsonBoots -value $contenuJsonBoots


    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_HELMET = ITEMS.register("'+ $nameL +'_helmet", () -> new '+ $nameF +'Helmet());
    public static final RegistryObject<Item> '+ $nameM +'_CHESTPLATE = ITEMS.register("'+ $nameL +'_chestplate", () -> new '+ $nameF +'Chestplate());
    public static final RegistryObject<Item> '+ $nameM +'_LEGGINGS = ITEMS.register("'+ $nameL +'_leggings", () -> new '+ $nameF +'Leggings());
    public static final RegistryObject<Item> '+ $nameM +'_BOOTS = ITEMS.register("'+ $nameL +'_boots", () -> new '+ $nameF +'Boots());'
}

# File ModItems
if ($contenuModItems -ne $contenuModItemsDefault) {
    $linkModItems = $pathJavaFile + "init\ModItems.java"
    ADD-content -path $linkModItems -value $contenuModItems
}

echo "--------------------------------------------------------------------------"
echo "BLOCK ORE"

$contenuModBlocksDefault = '
    // ' + $nameF
$contenuModBlocks = $contenuModBlocksDefault

#Ore to a Block
$isBlock = Read-Host "The ore to a Block? YES or NO | default: NO"
if ($isBlock -eq "") {
    $isBlock = "NO"
}

if ($isBlock -eq "YES")
{

    # OreBlock
    $contenuBlock = Add-Block $nameL "Block"
    $linkBlock = $pathJavaFile + "block\" + $nameF + "Block" + ".java"
    ADD-content -path $linkBlock -value $contenuBlock
    $contenuModBlocks = $contenuModBlocks + '
    public static RegistryObject<Block> '+ $nameM +'_BLOCK = createBlock("'+ $nameL +'_block", () -> new '+ $nameF +'Block());'
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_block" "Block" "Bloc de" "block"

    CreateJson-Block $pathBlockFile $modid $nameL"_block"

}

#Ore to a Ore
$isOreBlock = Read-Host "The ore to a Ore Block? YES or NO | default: NO"
if ($isOreBlock -eq "") {
    $isOreBlock = "NO"
}

if ($isOreBlock -eq "YES")
{

    # OreMinerai
    $contenuOreBlock = Add-Block $nameL "Ore"
    $linkOreBlock = $pathJavaFile + "block\" + $nameF + "Ore" + ".java"
    ADD-content -path $linkOreBlock -value $contenuOreBlock
    $contenuModBlocks = $contenuModBlocks + '
    public static RegistryObject<Block> '+ $nameM +'_ORE = createBlock("'+ $nameL +'_ore", () -> new '+ $nameF +'Ore());'
    CreateJson-Lang $nameL $pathLangFile $tierOreFinal $versionOreFinal "_ore" "Ore" "Minerai de" "block"

    CreateJson-Block $pathBlockFile $modid $nameL"_ore"

}

# File ModBlocks
if ($contenuModBlocks -ne $contenuModBlocksDefault) {
    $linkModBlocks = $pathJavaFile + "init\ModBlocks.java"
    ADD-content -path $linkModBlocks -value $contenuModBlocks
}

echo "--------------------------------------------------------------------------"
echo "UTILS ORE"

if ($isTool -eq "YES")
{

    $isParamTool = Read-Host "Detail Tool Parameters? YES or NO | default: NO"
    if ($isParamTool -eq "") {
        $isParamTool = "NO"
    }

    if ($isParamTool -eq "NO") {

        $linkCustomItem = $pathJavaFile + "utils\CustomItemTiers.java"
        $contenuCustomItem = '
    '+ $nameM +'_TOOL(1, 420, 4.8f, 1.5f, 10, new LazyValue<>(() -> {
    return Ingredient.of(ModItems.'+ $nameM +'.get());
    })),'
        ADD-content -path $linkCustomItem -value $contenuCustomItem

    }

    if ($isParamTool -eq "YES") {
        # PRECISE LES PARAM
    }

}

if ($isArmor -eq "YES")
{

    $isParamArmor = Read-Host "Detail Armor Parameters? YES or NO | default: NO"
    if ($isParamArmor -eq "") {
        $isParamArmor = "NO"
    }

    if ($isParamArmor -eq "NO") {

        $linkCustomArmor = $pathJavaFile + "utils\CustomArmorMaterials.java"
        $contenuCustomArmor = '
    '+ $nameM +'_ARMOR(TyroMod.ModId + ":'+ $nameL +'", 18, new int[]{2, 5, 7, 3}, 11, SoundEvents.ARMOR_EQUIP_IRON, 0.0f, 0.0f, () -> {
        return Ingredient.of(ModItems.'+ $nameM +'.get());
    }),'
        ADD-content -path $linkCustomArmor -value $contenuCustomArmor

    }

    if ($isParamArmor -eq "YES") {
        # PRECISE LES PARAM
    }
}

echo "--------------------------------------------------------------------------"
echo "CRAFT ORE"











