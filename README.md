This is a simple weed rolling script with custom animation and props.
oxlib is a dependency for this https://github.com/overextended/ox_lib

For adding new items just make sure the item name under rollable items matches the name for the item player is going to recieve

So for example the default setup is this:

Config = {
	framework = 'esx', --esx, qb
	rollableitems = { -- These are the items you need to have to roll up. It will check for any of these itemsfrom both categories
		blunts = { -- Blunt Items to load Brown Blunt Prop and Blunt Prop
			'backwood',
			--You can add more under here, but make sure to add this same item name to the usable items table below
		},	
		papers = { -- Joint Items to load Joint Paper Prop and Joint Prop
			'rawpaper',
			--You can add more under here, but make sure to add this same item name to the usable items table below
		}
	},
	usableItems = { -- The usable weed items that will initiate roll up process along with the items player will receive after rolling
		['biscotti_8th'] = {backwood = 'biscotti_backwood', rawpaper = 'biscotti_joint'}, 
		-- Add More here
	}
}

If you want to use a different item for backwood, and a different item for the item player will recieve it would be like this
Say I have 'dutchmaster' as a rollable blunt item & 'marleypaper' as a rollable paper item &
'biscotti_dutch' and 'biscotti_marley' as the items to recieve, it would look like this instead:

Config = {
	framework = 'esx', --esx, qb
	rollableitems = { -- These are the items you need to have to roll up. It will check for any of these itemsfrom both categories
		blunts = { -- Blunt Items to load Brown Blunt Prop and Blunt Prop
			'dutchmaster',
			--You can add more under here, but make sure to add this same item name to the usable items table below
		},	
		papers = { -- Joint Items to load Joint Paper Prop and Joint Prop
			'marleypaper',
			--You can add more under here, but make sure to add this same item name to the usable items table below
		}
	},
	usableItems = { -- The usable weed items that will initiate roll up process along with the items player will receive after rolling
		['biscotti_8th'] = {dutchmaster = 'biscotti_dutch', marleypaper = 'biscotti_marley'}, 
		-- Add More here
	}
}

So you can use whatever names you want just make sure the item name from rollable matches the type of item player will recieve.
If you need any help configuring just make a ticket in discord and we can get it figured out https://discord.gg/dccustomz
