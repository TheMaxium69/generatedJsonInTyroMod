function Add-Armor {

# ORE
    # Lower
    $oreL = $args[0].toLower()

    # Maj
    $oreM = $args[0].toUpper()

    # First Maj
    $oreF = (Get-Culture).textinfo.totitlecase($oreL)

# ARMOR
    # Lower
    $armorL = $args[1].toLower()

    # Maj
    $armorM = $args[1].toUpper()

    # First Maj
    $armorF = (Get-Culture).textinfo.totitlecase($armorL)

# armorTier

    if ($armorL -eq "helmet") {
        $armorTier = "HEAD"
    }
    if ($armorL -eq "chestplate") {
        $armorTier = "CHEST"
    }
    if ($armorL -eq "leggings") {
        $armorTier = "LEGS"
    }
    if ($armorL -eq "boots") {
        $armorTier = "FEET"
    }


$contenu = 'package fr.tyrolium.tyromod.item;

import fr.tyrolium.tyromod.TyroMod;
import fr.tyrolium.tyromod.init.ModItemGroup;
import fr.tyrolium.tyromod.utils.CustomArmorMaterials;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.util.ITooltipFlag;
import net.minecraft.inventory.EquipmentSlotType;
import net.minecraft.item.*;
import net.minecraft.util.text.ITextComponent;
import net.minecraft.util.text.TranslationTextComponent;
import net.minecraft.world.World;

import javax.annotation.Nullable;
import java.util.List;

public class '+ $oreF + $armorF +' extends ArmorItem {

    public static String itemString = "'+ $oreL +'_'+ $armorL +'";
    public static ItemGroup modItemGroup = ModItemGroup.TAB_TYROMOD;
    public static Properties properties = new Item.Properties().tab(modItemGroup);

    public static IArmorMaterial armorTier = CustomArmorMaterials.'+ $oreM +'_ARMOR;
    public static EquipmentSlotType equipmentSlotType = EquipmentSlotType.'+ $armorTier +';


    public '+ $oreF + $armorF +'() {
        super(armorTier, equipmentSlotType, properties);
    }

    @Override
    public void appendHoverText(ItemStack stack, @Nullable World worldIn, List<ITextComponent> tooltip, ITooltipFlag flagIn) {

        if(Screen.hasShiftDown()) {
            tooltip.add(new TranslationTextComponent("tooltip."+ TyroMod.ModId +"."+itemString+"_shift"));
        } else {
            tooltip.add(new TranslationTextComponent("tooltip."+ TyroMod.ModId +"."+itemString));
        }

        super.appendHoverText(stack, worldIn, tooltip, flagIn);
    }
}
'

return $contenu

}