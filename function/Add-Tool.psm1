function Add-Tool {

# ORE
    # Lower
    $oreL = $args[0].toLower()

    # Maj
    $oreM = $args[0].toUpper()

    # First Maj
    $oreF = (Get-Culture).textinfo.totitlecase($oreL)

# TOOL
    # Lower
    $toolL = $args[1].toLower()

    # Maj
    $toolM = $args[1].toUpper()

    # First Maj
    $toolF = (Get-Culture).textinfo.totitlecase($toolL)

# AttackDamageIn

    if ($toolL -eq "sword") {
        $attackDamageIn = "2"
    } else {
        $attackDamageIn = "0"
    }

# ClassName

    if ($toolL -eq "hammer") {
        $className = "Pickaxe"
    } else {
        $className = $toolF
    }


$contenu = 'package fr.tyrolium.tyromod.item;

import fr.tyrolium.tyromod.TyroMod;
import fr.tyrolium.tyromod.init.ModItemGroup;
import fr.tyrolium.tyromod.utils.CustomItemTiers;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.util.ITooltipFlag;
import net.minecraft.item.*;
import net.minecraft.util.text.ITextComponent;
import net.minecraft.util.text.TranslationTextComponent;
import net.minecraft.world.World;

import javax.annotation.Nullable;
import java.util.List;

public class '+ $oreF + $toolF +' extends '+ $className +'Item {

    public static String itemString = "'+ $oreL +'_'+ $toolL +'";
    public static ItemGroup modItemGroup = ModItemGroup.TAB_TYROMOD;
    public static Properties properties = new Item.Properties().stacksTo(1).tab(modItemGroup);

    public static IItemTier toolTier = CustomItemTiers.'+ $oreM +'_TOOL;
    public static int attackDamageIn = '+ $attackDamageIn +';
    public static float attackSpeedIn = -2.4f;

    public '+ $oreF + $toolF +'() {
        super(toolTier, attackDamageIn, attackSpeedIn, properties);
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