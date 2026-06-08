package com.mkmod.mcbr;

import com.mkmod.mcbr.config.BrModConfig;
import net.minecraftforge.common.MinecraftForge;
import net.minecraftforge.fml.ModLoadingContext;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.config.ModConfig;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@Mod(McBrMod.MOD_ID)
public class McBrMod {
    public static final String MOD_ID = "mcbr";
    public static final Logger LOGGER = LogManager.getLogger();

    public McBrMod() {
        ModLoadingContext.get().registerConfig(ModConfig.Type.SERVER, BrModConfig.SPEC);
        MinecraftForge.EVENT_BUS.register(new BrServerEvents());
        LOGGER.info("mcbr mod initialized");
    }
}
