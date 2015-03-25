private["_display","_list","_name","_crimes","_bounty","_units","_shopType"];


_display = findDisplay 80000;
_leftList = _display displayCtrl 80002;
_rightList = _display displayCtrl 80006;
_rightList lbDelete (lbCurSel 80006);