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
		['biscotti_8th'] = {
			backwood = 'biscotti_backwood', 
			rawpaper = 'biscotti_joint'}, 
		-- Add More here
	}
}
