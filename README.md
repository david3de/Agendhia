#Agendhia
##Gamified Daily Calendar and Task Planner App

#Concept Overview
Agendhia is an RPG/task manager/calendar planner mobile application in which users complete daily tasks in order to raise their monsters and receive loot. The game is designed to motivate the users to complete as many tasks as they can while maintaining a schedule. 

##Advantages: Game is 2D, and thus easy to create from a graphical standpoint. Game can be easily monetized with in-game content and items. Content can be easily generated to keep players playing. Once a player has their full schedules inputted into the app they are unlikely to leave. 

##Disadvantages: Game has heavy competition with indirect competing calendar/task apps as well as Habitica, which holds a very similar concept. 

##Monetization: Can be easily monetized through in-game purchases, with in game currency. Potentially can add offer wall or add watch component to gain more in-game currency. 

##Appeal:
1. Progression: players feel a sense of reward when leveling up and receiving more loot. Players may get attached to their monsters as well.
2. Customization: Players will be able to collect monsters/pets as well as customize their appearances and move sets. 
3. Gradual Gratification: Progression happens over time, urging players to come back and check on their to-dos as well as their pet’s status. 
4. Instant Gratification (gambling): Item gaining system of slot machines adds an addictive instant gratification element that has the potential to lock players into the game. 
5. Lots of Content: Easy to continuously generate end-game content for users by adding new items, monsters, etc. 
6. Online Aspect: Players can add friends to team up with and play together with. Compete with other players, potentially battle with them? 
6. Competition: Limit competition to avoid having players simply cheat. Small aspect of competition with friends, but mostly PvE. 
7. Casual: Game combat is not in real time, thus easy to jump in and out of. Game is low maintenance, players are playing by simply doing their daily activities. Very low skill cap, easy for players to get into. 

#UI / Productivity Concepts
UI will be similar to that of Habitica, with stats and pet health at the top at all times, and navigation residing at the bottom bar. Further Details in the storeboard. Navigation panels at the bottom are as follows: Calendar, tasks, RPG, and profile/settings. 

*Priorities: Having a functional Calendar and Tasks panel takes priority. In Calendar, completing the Day and Month tabs are most important. In the Task panel, completing the Day Tasks and most of the Unassigned Tasks is important. RPG priority will be discussed in the RPG section. *

##Calendar
Calendar will have three navigational settings at the top for Day, Week, and Month. 
*Day*: In the day tab, users will see a schedule of their day in which they put their class schedule. Schedule can be added month wide, for example, students can place their class schedules in for their entire quarter. Empty areas will be “time slots” in which tasks can be dropped into. 
*Week*: In the week tab, users will be able to scroll through all of their days which are displayed in a table-view format. Users can scroll through the week view infinitely (not limited to just that week). Each day slot on the table-view will have a summary of the events of the day. Tapping any particular day will bring users into the day tab for that day. 
*Month*: Month tab will show one month at a time, scrolling will go between the months. Days will be colored depending on how many events there are that day. Tapping any day of the month will bring users to the day tab for the selected day. 

##Tasks
The task page will act like a to-do list filled with unassigned tasks. There will be two tabs for this page: the day tasks, and the unassigned tasks. Swipe a task right or left to switch it between the day tasks and the unassigned tasks. 
Day Tasks: Day tasks includes dailies and any task assigned to today but without a particular time slot. Pressing and holding a task will change the background screen to the day view, where the task can be dropped into a time slot. 
Unassigned Tasks: The second tab will have tasks that must be done at some time in the future, or that have been determined as incomplete/past due. Pressing and holding this task will bring up the month calendar. Dropping it into the month view will assign it to the day in general, but not give it a time. It will then show up as the day tasks once that day arrives. 

##RPG
This panel will hold the different RPG activities. This will be discussed on the following page. 

##Settings/Profile
This panel shows the player’s profile and statistics such as what percent of dailies have been completed today, and a graph of their completion trends. This page also includes settings and logout features. Specifics of this page will be determined at a later date and are Low Priority.

#Core Game Dynamics
All game activities will be passed through the RPG panel. Pet status will be shown at the top. 

*Priorities: For the purposes of hackathon, we will only need one working pet with working items and proper stats that fluctuate based on appropriate task rewards/punishments. A battle system is a bonus if it can be implemented in time. Slot machine and any player-retaining content can wait until after hackathon. *

##Pet Status
*UI*: Similar to that of habitica, the top of the screen will be occupied by a picture of your pet (top left corner) with health, stamina, and xp bars to the right. Above this will be the pet’s level, name, and your currency amount. This area will disappear if the users scrolls down, but not move if the user scrolls up to refresh the page. 
*Stats*: All pets will have various stats. They will need health, damage, speed, armor, stamina, hunger, as well as their 4 abilities. It costs stamina to use abilities in a fight. Pets can restore stamina, health, and hunger when the user completes tasks. Pets get hungry over time when tasks remain overdue, but can only lose health and stamina from fighting. Pets that are out of health or hunger cannot be equipped anymore. 

#RPG Panel
The RPG Panel has various activities that players can perform using their pets, as well as key pet-related functions such as inventory and shop. 

*Inventory*: In the inventory, players can equip armor and weapons to their pets. Items either alter the pet’s stats, or appearance, but never both. Items are mostly earned through the slot machine, by purchase from the shop, as rewards from specific dungeons, or through upper level smelters. 
*Shop*: The shop contains purchasable items that cost gold (in-game free currency). Users can also sell items for 50% of it’s value. The shop will only allow common and uncommon items to be purchased through gold, leaving rarer items to be acquired through dungeons and the slot machine, or bought with tokens. You may also purchase tokens with real money. Tokens can be used to purchase exclusive items (both appearance and gear) as well as new pets. The shop also contains the slot machine, which will give users a random item/pet of a random rarity. The slot machine costs 1 token per spin. The smelter will take in items and melt them down into tokens. Common and uncommon items cannot be smelted. The enchanter is used to craft new abilities that can be given to pets. The enchanter involves adding three runes together to result in a random spell. Spells can be given to any pet. 
*Dungeons*: Dungeons are simply a series of text-based fights that pets can undergo. At any time during a fight, players can equip a different pet and use them to fight instead. They will be forced to do so if the pet runs out of health, food, or stamina during a fight. Completing a dungeon can reward players with tokens, rarer items, gold, or even more pets. Dungeons can be paused mid fight at any time, and will resume at the same spot whenever the player decides to fight again. The player also has the option to flee the dungeon at any time if they are being overwhelmed, though this will result in a loss of progress. 

#Level Progression
Good level progression and unlocks are key to keeping a player interested in a game long term. Thus it is important to set unlockables at appropriate levels. 
Players start with one pet and will earn money to buy gear for it.
