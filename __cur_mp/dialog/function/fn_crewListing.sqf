while {true} do
{
    if(player != vehicle player) then
    {
        _vehicle = assignedVehicle player;
        _listing = "<t color='#00FFFF' underline='true' align='center'>CREW</t><br/>";
        {
            if((driver _vehicle == _x) || (gunner _vehicle == _x)) then
            {
                if(driver _vehicle == _x) then
                {
                    _listing = _listing + format ["<t color='#CC2211'><img image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'></img> %1 </t><br/>",(_x getVariable ["realname",name _x])];
                }
                else
                {
                    _listing = _listing + format ["<t color='#AA4444'><img image='a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa'></img> %1 </t><br/>", (_x getVariable ["realname",name _x])];
                };
            }
            else
            {
                _listing = _listing + format ["<t color='#11DD55'><img image='a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa'></img> %1 </t><br/>", (_x getVariable ["realname",name _x])];
            };
        } forEach crew _vehicle;
        ((uiNamespace getVariable "crewListing")displayCtrl 1005)ctrlSetStructuredText parseText _listing;
        ((uiNamespace getVariable "crewListing")displayCtrl 1005)ctrlSetBackgroundColor [0, 0, 0, .2];
    }
    else
    {
        ((uiNamespace getVariable "crewListing")displayCtrl 1005)ctrlSetText "";
        ((uiNamespace getVariable "crewListing")displayCtrl 1005)ctrlSetBackgroundColor [0, 0, 0, 0];
    };
    uiSleep 0.5;
};