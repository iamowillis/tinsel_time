# Tinsel Time

> A seamless, vanilla-style Christmas datapack for Minecraft: Java Edition 26.3.

**Tinsel Time** is a server-friendly Christmas event datapack built around
dynamic snowstorms, realistic snow accumulation, snow-powered progression,
custom crafting, festive items, and winter transportation.

The goal is for every feature to feel like a natural extension of vanilla Minecraft
rather than a separate modded system.

> [!NOTE]
> Current Development includes:
> - The **Snowball** and **Big Snowball** mechanics.
> - The **Frozen Mistletoe** item summoning a **Blizzard**
> - A custom crafting station called the **North Pole Station**
> - Some custom blocks such as **Snow Bricks**, **Packed Snow Bricks**, and **Reinforced Permafrost Block**
> 
> Next Steps:
> - Fixing and adding macros to the current items and blocks
> - Adding custom crafting logic for the **North Pole Station**
> - Adding item progression (**snow bricks** => **packed snow bricks** => **reinforced permafrost ingot** => **cryogen core** => **spirit of christmas**)
> - Adding sled mechanics
> - Adding Tiered shovel tech tree & mechanics
> - Adding more items & blocks

---

## Table of Contents

- [Project Goals](#project-goals)
- [Initial Development Scope](#initial-development-scope)
- [Christmas Event](#christmas-event)
- [Snowstorm System](#snowstorm-system)
- [Snowball Mechanics](#snowball-mechanics)
- [Snow Clearing](#snow-clearing)
- [Snow Progression](#snow-progression)
- [Shovel Technology Tree](#shovel-technology-tree)
- [North Pole Desk](#north-pole-desk)
- [Planned Items and Blocks](#planned-items-and-blocks)
- [Starter Item Concepts](#starter-item-concepts)
- [Event-Ender Items](#event-ender-items)
- [Future World Mechanics](#future-world-mechanics)
- [Open Design Questions](#open-design-questions)
- [Development Roadmap](#development-roadmap)
- [Reference](#reference)

---

## Project Goals

- [ ] Replace ordinary rain with Christmas-themed snowstorms while the event is active.
- [ ] Increase snowstorm frequency as the configured date approaches Christmas.
- [ ] Support continuously running multiplayer servers.
- [ ] Dramatically reduce storm activity when no players are online.
- [ ] Introduce custom items, custom blocks, progression systems, food, consumables, vehicles, and festive effects.
- [ ] Build systems modularly so individual mechanics can be implemented and tested in stages.

---

## Initial Development Scope

The first implementation milestones focuses on the following:

**Throwables:**

1. **Snowball**
   - Places one snow layer where it lands.

2. **Big Snowball**
   - Places two snow layers across a 3×3 area around its impact point.

**Blizzard**

1. **Blizzard Mechanics**
    - Fixes to Bizzard mechanics

**North Pole Station:**

1. **The Station Mechanics**
    - Station detection and item detection
    - Fixes to item inputs and "security" (returning items put in the wrong slot)

2. **Custom Crafting**
    - Detects custom item `custom_data` to determine crafting recipe.

### Current Implementation

#### \[Current Implementation\]: Snowballs

**General:**

- Snowball impact *SHOULD* give knockback and make the player have blindness + a snow splat texture on their screen

**Snowball:**

- Mechanics for a normal snowball
    - Has projectile tracking
    - Places 1 layer of snow
    - Some impact detection

**Big Snowball:**

- Custom crafting support
- Points to item texture in resource pack

##### TODOs & Fixes

- General macro for snow layer placement
    - In the future I'd like to add tiered snowballs for more snow layers
    - For example, a snowball that makes a mini igloo when landing
    - Or "snowball cannon" that can launch certain snowballs

**Snowball:**

- multiplayer compatibility;
    - Not sure how how to test for snow splat texture impact since it doesn't really work in singleplayer...
- when hitting entity, DONT place snow layer (currently not working)

**Big Snowball:**

- Need to implement snow place mechanic (I had it at one point but the logic is MESSY)

>[!note] Because of the way that snowballs work in vanilla minecraft, I wonder if the way that the specific mechanics of a "snowball" are hardcoded to prevent any player-to-player object impact detection
> In the new winter update, minecraft WILL add snowball knockback on player-to-player without any damage
>
> But I'm wondering if changing the underlying item might make the impact mechanics better for what we're trying to do...

---

#### \[Current Implementation\]: Snowstorm Event

**General:**

- Using a `frozen_mistletoe` summons a **Blizzard**
- Blizzard mechanic works by using a `scoreboard objective tinsel.storm` and creating a "snowstorm-like" effect with snow particles
    - There's another mechanic to put snow layers within the loaded chunk that the player is in.
- Blizzard has a HUD display that uses `fonts` on the `\ue100` char.
    - Blizzard hud is located in the texturepacks `textures/font/blizzard_hud.png`
    - Has a countdown timer as well

##### TODOs & Fixes

- Instead of a "one-time use" for the frozen-mistletoe, it would be cool to instead have a "blizzard-radar" hud to show that "blizzard events" have been activated.
    - There would be a random chance every day/night for a blizzard to happen.
    - When a blizzard DOES happen, the current `blizzard_hud` would show up with its 1-minute countdown.

>[!error] \[BUG\]: The current snow layering *SORT-OF* works.
> It DOES add layers of snow around the player, but will only stack layers if there is a block above the player's head
>
> - There also isn't a limit to how long the snow blocks can stack. (I tested this and I had to delete a stack up to the world sky limit lol)
> - There should also be a more "seamless" way to distribute snow layers. There is no mechanic as of right now...

---

#### \[Current Implementation\]: North Pole Station

**General:**

- Custom Crafting UI
- Station detection through markers

##### TODOs & Fixes


>[!tldr] Biggest need for this is to set up macros for the custom crafting!

- Only when the player opens a station should the the station's tick function start!
    - Important to prevent server lag when there are multiple stations!
- Returns Item if placed in an "illegal" slot, i.e. a slot that isn't part of the input box
    - I currently use invisible barriers, but there are different bugs for that
- Barrier on output slot EXCEPT when there is a crafting output from a valid recipe
- When deleting the station, the station DROPS the barrier blocks. This should never happen

---

## Christmas Event

### Activation

>[!note] The following is from AI formatting my notes.
> Currently the `frozen_mistletoe` sort of does the "activation" but it would be cool to have the following

The Christmas event begins when a player uses a special starter item. The current working choice is the **Suspicious Ornament**, although several alternatives remain under consideration.

The starter item should behave similarly to a firework:

- it launches or flies when used;
- it creates a visible festive effect;
- it plays sleigh-bell audio while in flight;
- it activates the server-wide Christmas event;
- it allows players or administrators to configure how many real-world days remain until Christmas.

The configured number of days controls the relative frequency of snowstorms.

### Event State

The datapack should track whether the Christmas event is:

- inactive;
- active;
- ending automatically;
- ended manually.

### Event End Conditions

The event ends in either of two ways:

1. **Automatic ending:** the event ends on December 26, the day after Christmas.
2. **Manual ending:** a player uses an event-ending item, currently called the **Coal-Filled Stocking**.

A **Soot-Covered Hat**, inspired by Scrooge, is another possible event-ending item.

---

## Snowstorm System

While the Christmas event is active, snowstorms should replace normal rain.

### Desired Behavior

- Snowstorms become more frequent as Christmas approaches.
- Snowstorms create snow layers in eligible areas.
- The system converts Minecraft time into an approximation of real-world time.
- The system accounts for a server that remains online continuously.
- Storm chances are dramatically reduced while no players are online.
- Snowstorms may continue at a very low background rate without players, but they should not bombard the world with snow.
- Unloaded chunks must not be modified accidentally or receive uncontrolled snow accumulation.

### Time Conversion

The datapack needs a reliable conversion between Minecraft days and real-world days.

A vanilla Minecraft day lasts approximately **20 real-world minutes** while the game is actively ticking. Therefore:

- 72 Minecraft days ≈ 1 real-world day;
- 504 Minecraft days ≈ 1 real-world week;
- 2,160 Minecraft days ≈ 30 real-world days.

The final system may use one or both of the following:

- a manually configured `days_until_christmas` value;
- a tick-based elapsed-time counter for continuously running servers.

> [!IMPORTANT]
> A pure datapack cannot directly read the host machine's calendar. Automatic real-world date synchronization may require a server plugin, command automation, or an administrator-maintained setting.

### Player Presence

Storm logic should distinguish between:

- **one or more players online:** normal Christmas storm probability;
- **no players online:** dramatically reduced storm probability and limited world-changing operations.

---

## Snowball Mechanics

### Normal Snowball

When a normal snowball lands:

- identify its impact position;
- find a valid supporting block;
- place one snow layer on the surface;
- increase an existing snow layer by one when possible;
- avoid replacing non-replaceable blocks;
- respect the maximum number of layers supported by vanilla snow;
- remain safe when multiple players throw snowballs simultaneously.

### Big Snowball

The **Big Snowball** is a crafted custom item. On impact, it should:

- affect a 3×3 horizontal area centered on the impact;
- add two snow layers to each valid location;
- stack onto existing snow layers when possible;
- skip invalid or protected positions;
- provide a larger impact particle and sound effect than a normal snowball.

### Future Snowball Tiers

| Snowball | Planned behavior |
| --- | --- |
| Normal Snowball | Adds one snow layer at the impact point |
| Big Snowball | Adds two layers in a 3×3 area |
| Massive Snowball | Covers a much larger area, tentatively 9×9 |
| Rock-in-a-Snowball | Damaging prank projectile |
| Packed Ice Snowball | Places packed snow and deals increased damage |
| Cryogenic Core Snowball | Encases a target area in a large cube of snow |

Additional combat effects may include:

- a snow-splat screen effect;
    - Eventual "splat stacking" which can be achieved by using different splat PNGs
- temporary blindness;
- increased damage for advanced snowballs, or prolonged debuffs

---

## Snow Clearing

>[!warning] More AI notes. 
> I know this is something we probably DONT want to change since this
> fundamentally changes vanilla minecrafts behavior.

Snow should be cleared layer by layer rather than disappearing all at once.

### Intended Behavior

- A normal shovel removes one layer at a time.
- Each cleared layer yields approximately one to two snowballs.
- A snow block with multiple layers is replaced with the same block state minus one layer.
- The system preserves the remaining accumulated snow.
- Higher-tier shovels clear wider areas without necessarily removing every layer at once.

### Datapack Approximation

A datapack can approximate this mechanic by:

1. detecting when a player breaks a snow layer;
2. reading or tracking the number of layers before it is broken;
3. replacing the block with one fewer snow layer;
4. adjusting drops so the removed layer yields the intended number of snowballs.

> [!NOTE]
> Exact block-break interception and block-state preservation may require careful advancement, predicate, loot-table, raycast, or marker-based logic. The implementation should be tested for simultaneous breaks and high-latency multiplayer conditions.

---

## Snow Progression

### Material Tiers

| Tier | Stage | Material |
| ---: | --- | --- |
| 1 | Gathering | Snowball |
| 2 | Compressed | Snow Block |
| 3 | Masonry | Snow Bricks |
| 4 | Heavy Masonry | Packed Snow Bricks |
| 5 | Industrial | Reinforced Permafrost |
| 6 | Mythic | Cryogenic Core |
| 7 | Apex | Spirit of Christmas |

### Planned Crafting Progression

>[!important] If we're not doing the "one-layer at-a-time" mechanic, the recipes need to be adjusted.

| Input | Output | Equivalent snowballs |
| --- | --- | ---: |
| 2×2 Snowballs | 1 Snow Block | 4 |
| 2×2 Snow Blocks | 4 Snow Bricks | 4 per brick |
| 64 Snow Bricks | 1 Packed Snow Brick | 256 |
| 2×2 Packed Snow Bricks | 1 Reinforced Permafrost | 1,024 |
| 2×2 Reinforced Permafrost | 1 Cryogenic Core | 4,096 |
| 2×2 Cryogenic Cores | 1 Spirit of Christmas | 16,384 |

> [!NOTE]
> The Cryogenic Core and Spirit of Christmas recipes are provisional. Their costs may be adjusted after playtesting.

### Block Concepts

#### Packed Snow Bricks

Snow bricks inlaid with ice or packed ice, with:

- a subtle blue tint;
- a semi-translucent or polished border;
- a dense, heavy-masonry appearance.

#### Frosted or Ice-Rimmed Snow Bricks

A flatter tiled snow-brick variant intended for:

- alpine cabin floors;
- polished winter interiors;
- icy courtyards;
- decorative paths.

#### Possible Snow Types

- normal snow;
- packed snow;
- iced snow;
- black ice.

Each type may have progressively greater density, durability, and tool requirements.

Black Ice COULD increase acceleration speed, more than normal ice or packed ice.

---

## Shovel Technology Tree

Snow gathering should feed directly into a shovel-upgrade progression.

### Current Concept

| Level | Shovel | Tentative requirement | Planned behavior |
| ---: | --- | --- | --- |
| 1 | Normal Shovel | Any vanilla shovel | Removes one snow layer from one block |
| 2 | Enhanced Shovel | Vanilla materials plus Packed Snow Bricks | Removes one layer from a 2×2 area in front of the player |
| 3 | Spaded Shovel | Gold Shovel plus a large Packed Snow Brick cost | Removes one layer from a 3×3 area around or in front of the player |
| 4 | Name TBD | Diamond Shovel plus advanced snow materials | Larger-area or faster snow clearing |

Possible ingredients for the Enhanced Shovel include:

- wood;
- stone;
- copper;
- iron;
- one Packed Snow Brick.

The final technology tree may also use snow-clearing points or experience as an unlock condition.

---

## North Pole Station

The custom advanced crafting station will be called the **North Pole Station**.

Its major responsibility is differentiating note blocks or other display entities used to represent custom blocks and items.

### Candidate Recipe A

```json
{
  "pattern": ["SPS", "ICI", "SPS"],
  "key": {
    "S": "minecraft:snow_block",
    "P": "minecraft:packed_ice",
    "I": "minecraft:iron_ingot",
    "C": "minecraft:crafter"
  }
}
```

### Candidate Recipe B

```json
{
  "pattern": ["SPS", "IBI", "SPS"],
  "key": {
    "S": "minecraft:snow_block",
    "P": "minecraft:packed_ice",
    "I": "minecraft:iron_ingot",
    "B": "minecraft:sweet_berries"
  }
}
```

> [!WARNING]
> Candidate Recipe B includes `P` in the pattern but does not use it, and defines `B` without a clear station block such as a Crafter. The final recipe should be corrected before implementation.

### Functional Requirements

The North Pole Station should eventually:

- handle advanced custom recipes;
- distinguish custom item and block identifiers;
- support tiered crafting progression;
- prevent recipes from triggering with look-alike vanilla items;
- provide clear feedback for valid and invalid recipes.

---

## Planned Items and Blocks

### Custom Blocks

- Candy Cane Block
- Christmas Lights
- **Christmas Tree**
- Snow Bricks
- Packed Snow Bricks
- Reinforced Permafrost
- Cryogenic Core
- Spirit of Christmas
- possible packed, iced, and black-ice snow variants
- presents that behave like lucky blocks

### Utility Items

- Suspicious Ornament
- Frozen Mistletoe
- Coal-Filled Stocking
- Soot-Covered Hat
- Santa's Sack
- Santa's Little Bag (hehe)
- North Pole Station

### Food and Drinks

- Candy-Cane
- Hot Cocoa brewed in a Brewing Stand
- “Dunks” coffee
- Cookies
- Gingerbread Man
- Fruitcake

### Transportation

Sleds may be modeled using horses or another controllable vanilla entity.

Planned surface progression:

| Surface | Sled behavior |
| --- | --- |
| Ordinary land | Slow sliding |
| Snow and packed snow | Normal sleigh speed |
| Reinforced Permafrost | High speed |
| Cryogenic surfaces | Extreme speed |

Possible sled variants include:

- ordinary hill sleds;
- dog-led sleds.

>[!note] I would like to have two more varients of the sled
> One that includes crafting with permafrost ingots:
> - This would make the sled MUCH faster
>
> The other with a Spirit of Christmas:
> - This maybe could FLY... idk

---

## Starter Item Concepts

### Suspicious Ornament

Current preferred event starter.

| Glass | Gold Ingot | Glass |
| --- | --- | --- |
| Glass | Any Dye | Glass |
| Empty | Ender Pearl | Empty |

### SlayBell

Possible recipes include string, gold ingots or nuggets, and sweet berries.

Possible mechanics:

- launches like a firework;
- rings sleigh bells while flying;
- creates a festive particle trail;
- activates the Christmas event on use or impact.

### Frozen Mistletoe

Possible ingredients:

- one String at the top center;
- Spruce Leaves or Vines for the foliage;
- Blue Ice or Packed Ice on either side;
- Glow Berries in the bottom corners.

Possible mechanics:

- summons a heavy snowstorm;
- temporarily creates snow-compatible local conditions;
- enables snowfall in areas that normally cannot receive snow.

### Fruitcake

Proposed ingredients:

- three Sweet Berries;
- one Wheat;
- one Sugar;
- two Cocoa Beans;
- one Magma Cream as the unstable preserving ingredient.

### Glinting Star

Proposed ingredients:

- one Nether Star or Prismarine Crystals;
- four Gold Ingots;
- four Glowstone Dust.

### Festive Spark

An easier early-game starter option using:

- one Paper;
- one Gunpowder;
- one String;
- two Redstone Dust.

---

## Event-Ender Items

### Coal-Filled Stocking

The current working event-ending item. Using it should:

- stop new Christmas snowstorms;
- disable event-specific ambient effects;
- preserve or safely clean up persistent state;
- avoid deleting player-built custom blocks or earned items.

### Soot-Covered Hat

An alternate event-ending item inspired by Scrooge.

---

## Future World Mechanics

### Ambient Effects

- sleigh-bell sounds at night;
- a distant Santa silhouette crossing snowy skies;
- heavier snowfall as Christmas approaches;
- biome-sensitive snow accumulation;
- festive visual and audio feedback during storms.

### Santa's Sack

A custom storage item inspired by a Shulker Box, potentially with expanded capacity.

### Presents

Present blocks may act like lucky blocks and generate randomized rewards or consequences when opened.

### Snow Accumulation Safety

The datapack should avoid:

- modifying unloaded chunks;
- placing snow inside builds;
- covering invalid blocks;
- uncontrolled entity buildup;
- excessive per-tick scans;
- runaway snow accumulation while the server is empty.

---

## Open Design Questions

1. Should the primary event starter remain the **Suspicious Ornament**, or should it be the **SlayBell**, **Frozen Mistletoe**, **Fruitcake**, **Glinting Star**, or **Festive Spark**?
2. Should the datapack require administrators to enter `days_until_christmas`, or should server-side automation update it?
3. Should no-player storms be merely rare, or completely disabled?
4. How should custom blocks be represented: note blocks, display entities, interaction entities, or another vanilla-compatible method?
5. Should the Cryogenic Core recipe require four Reinforced Permafrost or a larger quantity of Packed Snow Bricks?
6. Should the Spirit of Christmas require four Cryogenic Cores, or retain a lower cost?
7. Should advanced shovel tiers require snow-clearing experience in addition to crafting ingredients?
8. How should snow accumulation interact with player claims, redstone builds, farms, and delicate decorative blocks?

---

## Development Roadmap

>[!important] This is AI slop, the more important section is the "Suggested Datapack Layout"

### Phase 1: Throwable Snow

- [ ] Establish namespace and datapack folder structure.
- [ ] Detect normal snowball projectiles and impacts.
- [ ] Add one snow layer at valid impact locations.
- [ ] Create and identify the Big Snowball custom item.
- [ ] Add two layers in a 3×3 impact area.
- [ ] Add particles, sounds, and multiplayer-safe cleanup.
- [ ] Test edge cases involving slabs, stairs, fluids, plants, existing snow, ceilings, and protected builds.

### Phase 2: Event Framework

- [ ] Add persistent event state.
- [ ] Implement the starter item.
- [ ] Add configurable days until Christmas.
- [ ] Implement automatic and manual event endings.
- [ ] Detect whether players are online.
- [ ] Implement storm-frequency scaling.

### Phase 3: Snow Accumulation and Clearing

- [ ] Replace rain with event snowstorms.
- [ ] Add controlled snow-layer accumulation.
- [ ] Implement one-layer-at-a-time shoveling.
- [ ] Adjust snowball drops.
- [ ] Add performance and unloaded-chunk safeguards.

### Phase 4: Progression

- [ ] Add Snow Bricks and Packed Snow Bricks.
- [ ] Add Reinforced Permafrost.
- [ ] Add Cryogenic Core and Spirit of Christmas.
- [ ] Implement shovel tiers.
- [ ] Add the North Pole Desk.

### Phase 5: Expanded Christmas Content

- [ ] Add Hot Cocoa and food items.
- [ ] Add sleds and surface-based speed.
- [ ] Add Santa's Sack and presents.
- [ ] Add advanced snowball weapons.
- [ ] Add ambient sounds and Santa effects.

---

## Suggested Datapack Layout

```text
TinselTime_DP/
├── pack.mcmeta
├── README.md
└── data/
    ├── minecraft/
    │   └── tags/
    │       └── function/
    │           ├── load.json
    │           └── tick.json
    └── tinsel/
        ├── advancement/
        ├── function/
        │   ├── system/
        │   │   ├── init.mcfunction
        │   │   ├── load.mcfunction
        │   │   ├── print.mcfunction
        │   │   ├── reload.mcfunction
        │   │   └── tick.mcfunction
        │   ├── event/
        │   ├── projectile/
        │   │   ├── snowball/
        │   │   └── big_snowball/
        │   ├── player/
        │   ├── snowstorm/
        │   ├── snow_clearing/
        │   ├── crafting/
        │   └── utility/
        ├── item_modifier/
        ├── loot_table/
        ├── predicate/
        ├── recipe/
        └── tags/
```

> [!NOTE]
> Folder names and supported datapack features should be verified against the exact Minecraft Java 26.3 data-pack format before implementation.

---

## Reference

- [Chimerabot's Sailboats datapack](https://www.planetminecraft.com/data-pack/chimerabot-s-sailboats-entry-for-speed-packing-datapack-contest-1-17/) — possible reference for sled or vehicle behavior.

