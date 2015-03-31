if(isNull (gsn_recruit_reporter select 1)) then
{
	player setVariable["recruitPosition","newsReporter",true];
	gsn_recruit_reporter set [1, player];
	gsn_has_job = true;
	[["gsn_recruit_reporter",gsn_recruit_reporter],"life_fnc_netSetVar",nil,false] spawn life_fnc_MP;
};