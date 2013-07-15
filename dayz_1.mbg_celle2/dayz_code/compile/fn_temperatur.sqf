/*
Author: TeeTime

Enhanced for DayZ: Namalsk by Sumrak.

Does: Manages the body temperatur of a Player

Possible Problems:
	=>  Balancing

Missing: 
	No Snow checker!!!
	Save Functions
	Shivering Function need improments
	

Dynamic Enhancements by Graz
The following is desinged to produce dynamic circumstances instead of mearly stacking positive and negative buffs
Essentially  the effect of the elements can be reduced by clothing or cover.
Some positive effects will not protect you from certain elements eg. warm clothes will not be as warm when it's raining!
*/
	private ["_looptime","_sun_factor","_building_factor","_vehicle_factor","_fire_factor","_water_factor","_snow_factor","_rain_factor","_night_factor","_wind_factor","_difference","_hasfireffect","_isinbuilding","_isinvehicle","_raining","_sunrise","_building","_fireplaces","_wearinghazmat","_haswarmclothes","_clothes_factor","_moving_factor","_sheltered","_hazmat_list","_part_warm_list","_full_warm_list","_daytime","_temp"];
	
	_looptime 			= _this;
//Positive effects
	_vehicle_factor		=	10; 
	_building_factor 	=  	14; 
	_moving_factor 		=  	8;
	_fire_factor		=	20;
	_sun_factor			= 	5;	
	_clothes_factor		=	0; //Adjusted in script

//max sunfactor linear over the day. highest value in the middle of the day
// _fire_factor should be always:  _rain_factor + _night_factor + _wind_factor OR higher !

//negative effects	
	_snow_factor		=	-20;	//In Car/Building : 1/2
	_water_factor		= 	-60;	//Cold water is cold!
	_rain_factor		=	-8;		//In Building, Hazmat & /or Vehicle : 0
	_night_factor		= 	-7; 	//
	_wind_factor	    =	-5; 	//In Building or Vehicle : 0 OR Warm Clothes: 1/2
//    _chill_factor     =   0;   	//Future Variable

	_difference 	= 0;
	_hasfireffect	= false;
	_isinbuilding	= false;
	_isinvehicle	= false;
	_wearinghazmat 	= false;
	_haswarmclothes	= false;
	_sheltered 		= false;

	_raining 		= if(rain > 0) then {true} else {false};
	_sunrise		= call world_sunRise;
	
//Is survivor wearing a hazmat?
_hazmat_list = ["Hazmat","Hazmat_Black_DZC","HazmatVest_Black_DZC","Hazmat_Red_DZC","HazmatVest_Red_DZC","Hazmat_Yellow_DZC","HazmatVest_Yellow_DZC","Hazmat_Olive_DZC","HazmatVest_Olive_DZC"];
if ((typeOf player) in _hazmat_list) then {_wearinghazmat = true};
	
	//Is Survivor wearing warm clothes
	_part_warm_list = ["DevoutMan1_DZC","Storm_Trooper1_DZC","Storm_Trooper2_DZC","MilitiaMan1_DZC","HazmatVest_Red_DZC","HazmatVest_Yellow_DZC","HazmatVest_Olive_DZC","Soldier1_SF_DZC","Soldier2_SF_DZC","Soldier3_SF_DZC"];
	_full_warm_list =["CZ_Heavy1_DZC","CZ_Heavy2_DZC","CZ_Heavy3_DZC","BAF_Heavy1_DZC""BAF_Heavy2_DZC","BAF_Heavy3_DZC","US_Heavy1_DZC","US_Heavy2_DZC","Snow_Trooper1_DZC","Snow_Trooper2_DZC","HazmatVest_Black_DZC"];
		if ((typeOf player) in _part_warm_list)
		then {
		_haswarmclothes = true;
		_clothes_factor = 8;
		};

		if ((typeOf player) in _full_warm_list)
		then {
		_haswarmclothes = true;
		_clothes_factor = 12;
		};

	//POSITIVE EFFECTS
	
	_difference = _difference + _clothes_factor;
	   	
	//vehicle
	if((vehicle player) != player) then {
		_difference 	= _difference + _vehicle_factor;
		_isinvehicle 	= true;
	} else {
		//speed factor  0 - 6 -  18 - 23
		private["_vel","_speed"];
		_vel = 		velocity player;
		_speed = 	round((_vel distance [0,0,0]) * 3.5);
		_difference = (_moving_factor * (_speed / 20)) min 7;
	};
	
	//fire
	private ["_fireplaces"];
	_fireplaces = nearestObjects [player, ["Land_Fire","Land_Campfire"], 8];
	if(({inflamed _x} count _fireplaces) > 0 && !_isinvehicle ) then {
		//Math: factor * 1 / (0.5*(distance max 1)^2) 		0.5 = 12.5% of the factor effect in a distance o 4 meters
		_difference 	= _difference + (_fire_factor /(0.5*((player distance (_fireplaces select 0)) max 1)^2));
		_hasfireffect 	= true;
	};
	
	//building
	_building = nearestObject [player, "HouseBase"];
	if(!isNull _building) then {
		if([player,_building] call fnc_isInsideBuilding) then {
			_isinbuilding	= true;
			dayz_inside 	= true;
		} else {
			dayz_inside 	= false;
		};
	} else {
		dayz_inside 	= false;
	};
	if (_isinbuilding) then {
	_difference 	= _difference + _building_factor;
	};
	
	//sun
	if(daytime > _sunrise && daytime < (24 - _sunrise) && !_raining && overcast <= 0.6 && !_isinbuilding) then {
		
		/*Mathematic Basic
		
		t = temperature effect
		
		a = calcfactor
		f = sunfactor
		s = sunrise
		d = daytime
		
		I:	a = f / (12 - s)²
		II:	t = -a * (d - 12)² + f
		
		I + II =>
		
		t = -(f / (12 - s)²) * (d - 12)² + f
		
		Parabel with highest Point( greatest Effect == _sun_factor) always at 12.00
		Zero Points are always at sunrise and sunset -> Only Positiv Values Possible
		*/
		
		_difference = _difference + (-((_sun_factor / (12 - _sunrise)^2)) * ((daytime - 12)^2) + _sun_factor);
	};

//Modifications
	//Addback for rain and water
		_rain_factor = _rain_factor - _clothes_factor;
		_water_factor = _water_factor - _clothes_factor;
	//Is player Sheltered?
	if (_isinbuilding || _isinvehicle)	then {_sheltered = true};
		
	//Modify Wind against warm clothes
	if (_haswarmclothes) then {_wind_factor = _wind_factor / 2;};
	//Modify wind & snow if sheltered
	if (_sheltered) then {
		_snow_factor = _snow_factor / 2;
		_wind_factor = 0;
		_rain_factor = 0;
	};


	//NEGATIVE  EFFECTS
	
	//water
	if(dayz_isSwimming) then {
		_difference = _difference + _water_factor;
	};
	
	//rain
	if(_raining && !_wearinghazmat) then {
		_difference = _difference + _rain_factor;
	};
	
	//night
	private ["_daytime"];
	if(daytime < _sunrise || daytime > (24 - _sunrise)) then {
		_daytime 	= if(daytime < 12) then {daytime + 24} else {daytime};
		if (_isinbuilding) then {
			_difference = _difference + ((((_night_factor * -1) / (_sunrise^2)) * ((_daytime - 24)^2) + _night_factor))/2;
		} else {
			_difference = _difference + (((_night_factor * -1) / (_sunrise^2)) * ((_daytime - 24)^2) + _night_factor);
		};
		
	};
	
	//wind
	if(((wind select 0) > 4 || (wind select 1) > 4)) then {
		_difference = _difference + _wind_factor;
	};

	
	//Calculate Change Value			Basic Factor			Looptime Correction			Adjust Value to current used temperatur scala
	_difference = _difference * SleepTemperatur / (60 / _looptime)		* ((dayz_temperaturmax - dayz_temperaturmin) / 100);
	
	//Change Temperatur															 Should be moved in a own Function to allow adding of Items which increase the Temp like "hot tea"
	dayz_temperatur = (((dayz_temperatur + _difference) max dayz_temperaturmin) min dayz_temperaturmax);
	
	//Add Shivering
	//						Percent when the Shivering will start 
	if(dayz_temperatur <= (0.100 * (dayz_temperaturmax - dayz_temperaturmin) + dayz_temperaturmin)) then { // DayZ: Celle, 0.100 was 0.125
		//CamShake as linear Function Maximum reached when Temp is at temp minimum. First Entry = Max Value
		_temp = 0.6 * (dayz_temperaturmin / dayz_temperatur );
		addCamShake [_temp,(_looptime + 1),30];	//[0.5,looptime,6] -> Maximum is 25% of the Pain Effect	
	} else {
		addCamShake [0,0,0];			//Not needed at the Moment, but will be necesarry for possible Items
	};


