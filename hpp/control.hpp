class airfreight {
	idd = 1234;
	onLoad = "uiNamespace setVariable ['airfreight_dialog', _this select 0]";
	class controls {
		class text : RscText 
		{
			idc = 1000;
			x = 0.422656*safezoneW+safezoneX;
			y = 0.192*safezoneH+safezoneY;
			w = 0.170156*safezoneW;
			h = 0.066*safezoneH;
			text = "Altis Air Agency";
			sizeEx = 2*GUI_GRID_CENTER_H; // Text size
			
		};
		class airtext : RscText 
		{
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.1875;
			y = safeZoneY + safeZoneH * 0.26909723;
			w = safeZoneW * 0.08203125;
			h = safeZoneH * 0.03298612;
			text = "Vehicles";
			sizeEx = GUI_GRID_CENTER_H; // Text size
			
		};
		class vehiclelistbox : RscListBox 
		{
			idc = 1500;
			x = safeZoneX + safeZoneW * 0.171875;
			y = safeZoneY + safeZoneH * 0.3125;
			w = safeZoneW * 0.10839844;
			h = safeZoneH * 0.38541667;
			colorBackground[] = {0.2,0.2,0.2,1};
			font = "PuristaMedium";
			sizeEx = GUI_GRID_CENTER_H; // Text size
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class jobdetailsbox : RscStructuredText 
		{
			idc = 1100;
			x = 0.525781*safezoneW+safezoneX;
			y = 0.39*safezoneH+safezoneY;
			w = 0.211406*safezoneW;
			h = 0.297*safezoneH;
			text = "select";
			
			colorBackground[] = {0.2,0.2,0.2,1};
			class Attributes
			{
				font = "RobotoCondensed";
				color = "#ffffff";
				align = "left";
				
			};
			
		};
		class desinations : RscListBox 
		{
			idc = 1700;
			x = safeZoneX + safeZoneW * 0.28515625;
			y = safeZoneY + safeZoneH * 0.3125;
			w = safeZoneW * 0.10839844;
			h = safeZoneH * 0.38541667;
			colorBackground[] = {0.2,0.2,0.2,1};
			font = "PuristaMedium";
			sizeEx = GUI_GRID_CENTER_H; // Text size
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class destintationtext : RscText 
		{
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.30078125;
			y = safeZoneY + safeZoneH * 0.26909723;
			w = safeZoneW * 0.08203125;
			h = safeZoneH * 0.03298612;
			text = "Desinations";
			sizeEx = GUI_GRID_CENTER_H; // Text size
			
		};
		class buttonstart : RscButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.48242188;
			y = safeZoneY + safeZoneH * 0.72048612;
			w = safeZoneW * 0.07714844;
			h = safeZoneH * 0.04340278;
			text = "Start";
			action = "[(lbCurSel 1500),(lbCurSel 1700),(lbCurSel 1800)] call xat_fnc_startmission";
			colorBackground[] = {0.2,0.4,0.2,1};
			sizeEx = GUI_GRID_CENTER_H; // Text size
			
		};
		class buttoncancel : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.38964844;
			y = safeZoneY + safeZoneH * 0.72048612;
			w = safeZoneW * 0.07714844;
			h = safeZoneH * 0.04340278;
			text = "Cancel";
			colorBackground[] = {0.2,0.2,0.2,1};
			sizeEx = GUI_GRID_CENTER_H; // Text size
			
		};
		class cargolist : RscListBox 
		{
			idc = 1800;
			x = safeZoneX + safeZoneW * 0.40722657;
			y = safeZoneY + safeZoneH * 0.3125;
			w = safeZoneW * 0.10839844;
			h = safeZoneH * 0.38541667;
			colorBackground[] = {0.2,0.2,0.2,1};
			font = "PuristaMedium";
			sizeEx = GUI_GRID_CENTER_H; // Text size
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class cargotext : RscText 
		{
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.42285157;
			y = safeZoneY + safeZoneH * 0.26909723;
			w = safeZoneW * 0.08203125;
			h = safeZoneH * 0.03298612;
			text = "Cargo";
			sizeEx = GUI_GRID_CENTER_H; // Text size
			
		};
	};
};