function Add-Block {

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

    $contenu = 'package fr.tyrolium.tyromod.block;

import fr.tyrolium.tyromod.TyroMod;
import fr.tyrolium.tyromod.init.ModItemGroup;
import net.minecraft.block.AbstractBlock;
import net.minecraft.block.Block;
import net.minecraft.block.material.Material;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.util.ITooltipFlag;
import net.minecraft.item.ItemGroup;
import net.minecraft.item.ItemStack;
import net.minecraft.util.text.ITextComponent;
import net.minecraft.util.text.TranslationTextComponent;
import net.minecraft.world.World;
import net.minecraftforge.common.ToolType;

import javax.annotation.Nullable;
import java.util.List;

public class '+ $oreF + $extF +' extends Block {

    public static String blockString = "'+ $oreL + "_" + $extL +'";
    public static Properties properties = Properties.copy(new Block(Properties.of(Material.METAL).strength(5f, 20f).harvestLevel(1).harvestTool(ToolType.PICKAXE)));

    public '+ $oreF + $extF +'() {
        super(properties);
    }

    public void appendHoverText(ItemStack stack, @Nullable World worldIn, List<ITextComponent> tooltip, ITooltipFlag flagIn) {

        if(Screen.hasShiftDown()) {
            tooltip.add(new TranslationTextComponent("tooltip."+ TyroMod.ModId +"."+blockString+"_shift"));
        } else {
            tooltip.add(new TranslationTextComponent("tooltip."+ TyroMod.ModId +"."+blockString));
        }

        super.appendHoverText(stack, worldIn, tooltip, flagIn);
    }

}
'

return $contenu



}