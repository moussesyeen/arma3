if((gsn_recruit_reporter select 1) == player) then
{
	player setVariable["recruitPosition","none",true];
	gsn_recruit_reporter set [1, ObjNull];
	gsn_has_job = false;
	[["gsn_recruit_reporter",gsn_recruit_reporter],"life_fnc_netSetVar",nil,false] spawn life_fnc_MP;
};