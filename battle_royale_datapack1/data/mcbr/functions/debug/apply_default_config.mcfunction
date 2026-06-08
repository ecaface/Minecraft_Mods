# Apply the default datapack config values to this world again.

function mcbr:load_config_defaults
tellraw @s [{"text":"[mcbr] Default config applied to this world.","color":"green"}]
