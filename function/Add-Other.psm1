function Add-Other {

# ORE
    # Lower
    $oreL = $args[0].toLower()

    # Maj
    $oreM = $args[0].toUpper()

    # First Maj
    $oreF = (Get-Culture).textinfo.totitlecase($oreL)

# TOOL
    # Lower
    $extL = $args[1].toLower()

    # Maj
    $extM = $args[1].toUpper()

    # First Maj
    $extF = (Get-Culture).textinfo.totitlecase($extL)

$contenu = 'package fr.tyrolium.tyromod.item;

import fr.tyrolium.tyromod.TyroMod;
import fr.tyrolium.tyromod.init.ModItemGroup;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.util.ITooltipFlag;
import net.minecraft.item.Item;
import net.minecraft.item.ItemGroup;
import net.minecraft.item.ItemStack;
import net.minecraft.util.text.ITextComponent;
import net.minecraft.util.text.TranslationTextComponent;
import net.minecraft.world.World;
import javax.annotation.Nullable;
import java.util.List;

public class '+ $oreF + $extF +' extends Item {

    public static String itemString = "'+ $oreL + "_" + $extL +'";
    public static ItemGroup modItemGroup = ModItemGroup.TAB_TYROMOD;
    public static Properties properties = new Item.Properties().tab(modItemGroup);;

    public '+ $oreF + $extF +'() {
        super(properties);
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