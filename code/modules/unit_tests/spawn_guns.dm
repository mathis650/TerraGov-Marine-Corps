/datum/unit_test/spawn_gun/Run()
	for(var/gun_to_test in subtypesof(/obj/item/weapon/gun))
		var/obj/item/weapon/gun/gun = allocate(gun_to_test, TRUE)
		for(var/attachment_type in gun.starting_attachment_types)
			if(!(attachment_type in gun.attachable_allowed))
				Fail("[attachment_type] is specified as a starting attachment, however it is not an allowed attachment. Called from [gun].")
		if(!CHECK_BITFIELD(gun.reciever_flags, AMMO_RECIEVER_HANDFULS) && gun.default_ammo_type && !(gun.default_ammo_type in gun.allowed_ammo_types))
			Fail("[gun] has a specified default_ammo_type that is not present in the allowed_ammo_types.")
		if(gun.fire_delay * 10 % 5) //a%0.5 doesn't work, thanks byond
			Fail("[gun] has a fire delay that is not a multiple of 0.5.")
		if(gun.burst_delay * 10 % 5)
			Fail("[gun] has a burst delay that is not a multiple of 0.5.")
		if(gun.extra_delay * 10 % 5)
			Fail("[gun] has a burst extra delay that is not a multiple of 0.5.")
		if(gun.wield_delay * 10 % 5)
			Fail("[gun] has a wield delay that is not a multiple of 0.5.")
		if(gun.wield_penalty * 10 % 5)
			Fail("[gun] has a wield penalty that is not a multiple of 0.5.")
		if(gun.aim_fire_delay * 10 % 5)
			Fail("[gun] has an aim fire delay that is not a multiple of 0.5.")
