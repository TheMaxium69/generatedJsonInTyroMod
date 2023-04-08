Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Contenu.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Tool.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Other.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\Add-Armor.psm1"
Import-Module -Name "E:\Minecraft\TyroMod\generatedMineraixInTyroMod\function\CreateJson-Item.psm1"

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

echo "--------------------------------------------------------------------------"
#Name Ore
$name = Read-Host "the NAME of your Ore";

# Lower
$nameL = $name.toLower()

# Maj
$nameM = $name.toUpper()

# First Maj
$nameF = (Get-Culture).textinfo.totitlecase($nameL)

# -------------------------------------------------------------------

#Ore to an Ingot
$isIngot = Read-Host "It is a Ingot? YES or NO | default: NO"
if ($isIngot -eq "") {
    $isIngot = "NO"
}

if ($isIngot -eq "YES") {
    # OreIngot
    $contenuIngot = Add-Other $nameL "Ingot"
    $linkIngot = $pathJavaFile + "item\" + $nameF + "Ingot" + ".java"
    ADD-content -path $linkIngot -value $contenuIngot
    $contenuModItems = '
    // '+ $nameF +'
    public static final RegistryObject<Item> '+ $nameM +'_INGOT = ITEMS.register("'+ $nameL +'_ingot", () -> new '+ $nameF +'Ingot());'

    $contenuJsonIngot = CreateJson-Item $nameL"_ingot" "generated"
    $linkJsonIngot = $pathResourceFile + $nameL + "_ingot.json"
    ADD-content -path $linkJsonIngot -value $contenuJsonIngot
}

if ($isIngot -eq "NO") {
    # OreDefault
    $contenuDef = Add-Contenu $nameF $nameL
    $linkDef = $pathJavaFile + "item\" + $nameF + ".java"
    ADD-content -path $linkDef -value $contenuDef
    $contenuModItems = '
    // '+ $nameF +'
    public static final RegistryObject<Item> '+ $nameM +' = ITEMS.register("'+ $nameL +'", () -> new '+ $nameF +'());'

    $contenuJsonDef = CreateJson-Item $nameL "generated"
    $linkJsonDef = $pathResourceFile + $nameL + ".json"
    ADD-content -path $linkJsonDef -value $contenuJsonDef

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

    $contenuJsonStick = CreateJson-Item $nameL"_stick" "generated"
    $linkJsonStick = $pathResourceFile + $nameL + "_stick.json"
    ADD-content -path $linkJsonStick -value $contenuJsonStick
}

#Ore to a Tool
$toolDefault = "NO"
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

    $contenuJsonSword = CreateJson-Item $nameL"_sword" "handheld"
    $linkJsonSword = $pathResourceFile + $nameL + "_sword.json"
    ADD-content -path $linkJsonSword -value $contenuJsonSword

    # OrePickaxe
    $contenuPickaxe = Add-Tool $nameL "Pickaxe"
    $linkPickaxe = $pathJavaFile + "item\" + $nameF + "Pickaxe" + ".java"
    ADD-content -path $linkPickaxe -value $contenuPickaxe

    $contenuJsonPickaxe = CreateJson-Item $nameL"_pickaxe" "handheld"
    $linkJsonPickaxe = $pathResourceFile + $nameL + "_pickaxe.json"
    ADD-content -path $linkJsonPickaxe -value $contenuJsonPickaxe

    # OreAxe
    $contenuAxe = Add-Tool $nameL "Axe"
    $linkAxe = $pathJavaFile + "item\" + $nameF + "Axe" + ".java"
    ADD-content -path $linkAxe -value $contenuAxe

    $contenuJsonAxe = CreateJson-Item $nameL"_axe" "handheld"
    $linkJsonAxe = $pathResourceFile + $nameL + "_axe.json"
    ADD-content -path $linkJsonAxe -value $contenuJsonAxe

    # OreShovel
    $contenuShovel = Add-Tool $nameL "Shovel"
    $linkShovel = $pathJavaFile + "item\" + $nameF + "Shovel" + ".java"
    ADD-content -path $linkShovel -value $contenuShovel

    $contenuJsonShovel = CreateJson-Item $nameL"_shovel" "handheld"
    $linkJsonShovel = $pathResourceFile + $nameL + "_shovel.json"
    ADD-content -path $linkJsonShovel -value $contenuJsonShovel

    # OreHoe
    $contenuHoe = Add-Tool $nameL "Hoe"
    $linkHoe = $pathJavaFile + "item\" + $nameF + "Hoe" + ".java"
    ADD-content -path $linkHoe -value $contenuHoe

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

        $contenuJsonSwordFire = CreateJson-Item $nameL"_sword_fire" "handheld"
        $linkJsonSwordFire = $pathResourceFile + $nameL + "_sword_fire.json"
        ADD-content -path $linkJsonSwordFire -value $contenuJsonSwordFire
    }
}

#Ore to a Armor
$armorDefault = "NO"
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

    $contenuJsonHelmet = CreateJson-Item $nameL"_helmet" "handheld"
    $linkJsonHelmet = $pathResourceFile + $nameL + "_helmet.json"
    ADD-content -path $linkJsonHelmet -value $contenuJsonHelmet

    # OreChestplate
    $contenuChestplate = Add-Armor $nameL "Chestplate"
    $linkChestplate = $pathJavaFile + "item\" + $nameF + "Chestplate" + ".java"
    ADD-content -path $linkChestplate -value $contenuChestplate

    $contenuJsonChestplate = CreateJson-Item $nameL"_chestplate" "handheld"
    $linkJsonChestplate = $pathResourceFile + $nameL + "_chestplate.json"
    ADD-content -path $linkJsonChestplate -value $contenuJsonChestplate

    # OreLeggings
    $contenuLeggings = Add-Armor $nameL "Leggings"
    $linkLeggings = $pathJavaFile + "item\" + $nameF + "Leggings" + ".java"
    ADD-content -path $linkLeggings -value $contenuLeggings

    $contenuJsonLeggings = CreateJson-Item $nameL"_leggings" "handheld"
    $linkJsonLeggings = $pathResourceFile + $nameL + "_leggings.json"
    ADD-content -path $linkJsonLeggings -value $contenuJsonLeggings

    # OreBoots
    $contenuBoots = Add-Armor $nameL "Boots"
    $linkBoots = $pathJavaFile + "item\" + $nameF + "Boots" + ".java"
    ADD-content -path $linkBoots -value $contenuBoots

    $contenuJsonBoots = CreateJson-Item $nameL"_boots" "handheld"
    $linkJsonBoots = $pathResourceFile + $nameL + "_boots.json"
    ADD-content -path $linkJsonBoots -value $contenuJsonBoots


    $contenuModItems = $contenuModItems + '
    public static final RegistryObject<Item> '+ $nameM +'_HELMET = ITEMS.register("'+ $nameL +'_helmet", () -> new '+ $nameF +'Helmet());
    public static final RegistryObject<Item> '+ $nameM +'_CHESTPLATE = ITEMS.register("'+ $nameL +'_chestplate", () -> new '+ $nameF +'Chestplate());
    public static final RegistryObject<Item> '+ $nameM +'_LEGGINGS = ITEMS.register("'+ $nameL +'_leggings", () -> new '+ $nameF +'Leggings());
    public static final RegistryObject<Item> '+ $nameM +'_BOOTS = ITEMS.register("'+ $nameL +'_boots", () -> new '+ $nameF +'Boots());'
}

$linkModItems = $pathJavaFile + "init\ModItems.java"
ADD-content -path $linkModItems -value $contenuModItems

# -------------------------------------------------------------------

if ($isTool -eq "YES")
{
    $linkCustomItem = $pathJavaFile + "utils\CustomItemTiers.java"
    $contenuCustomItem = '
    '+ $nameM +'_TOOL(1, 420, 4.8f, 1.5f, 10, new LazyValue<>(() -> {
    return Ingredient.of(ModItems.'+ $nameM +'.get());
    })),'
    ADD-content -path $linkCustomItem -value $contenuCustomItem
}

if ($isArmor -eq "YES")
{
    $linkCustomArmor = $pathJavaFile + "utils\CustomArmorMaterials.java"
    $contenuCustomArmor = '
    '+ $nameM +'_ARMOR(TyroMod.ModId + ":'+ $nameL +'", 18, new int[]{2, 5, 7, 3}, 11, SoundEvents.ARMOR_EQUIP_IRON, 0.0f, 0.0f, () -> {
        return Ingredient.of(ModItems.'+ $nameM +'.get());
    }),'
    ADD-content -path $linkCustomArmor -value $contenuCustomArmor
}













