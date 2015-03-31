if(!dialog) then {
	createDialog "jobs_menu";
};
disableSerialization;
_display = findDisplay 3400;
_takenJobs = _display displayCtrl 2402;
_avilableJobs = _display displayCtrl 2401;

//_possibleJobs = [gsn_recruit_reporter,gsn_recruit_towtruck,gsn_recruit_carsales,gsn_recruit_housesales];
_possibleJobs = [gsn_recruit_reporter];
_count =0;
{
	_jobHolder = _x select 1;
	_jobName = _x select 0;
	if(isNull _jobHolder) then
	{
		_avilableJobs lbAdd format["%1",_jobName];
		_avilableJobs lbSetData [(lbSize _avilableJobs)-1,_jobName];
		_avilableJobs lbSetValue [(lbSize _avilableJobs)-1,_count];
	}
	else
	{
		_takenJobs lbAdd format["%1  (%2)",_jobName, _jobHolder getVariable["realname",name driver _jobHolder]];
		_takenJobs lbSetData [(lbSize _takenJobs)-1,_jobName];
		_takenJobs lbSetValue [(lbSize _takenJobs)-1,_count];
	};
	_count = _count + 1;
}foreach _possibleJobs;
