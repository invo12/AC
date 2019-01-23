#pragma once
#include "CAircraft.h"

namespace FlyingObj
{
	class CAircraftType
	{
	public:
		static const int AIRPLANE = 1;
		static const int GLIDER = 2;
		static char* GetTypeName(int x);
	};
	char* CAircraftType::GetTypeName(int x)
	{
		if (x == 1)
		{
			return "AIRPLANE";
		}
		else
			return "GLIDER";
	}
	class CPropulsionType
	{
	public:
		static const int NONE = 0;
		static const int JET = 1;
		static const int PROPELLER = 2;
		static char* GetTypeName(int x);
	};
	char* CPropulsionType::GetTypeName(int x)
	{
		if (x == 1)
		{
			return "JET";
		}
		if (x == 2)
		{
			return "PROPELLER";
		}
		if (x == 0)
		{
			return "NONE";
		}
	}
	class CGliderType
	{
	public:
		static const int CLUB = 1;
		static const int STANDARD = 2;
		static const int DUAL_SEATS = 3;
		static const int OPEN = 4;
		static char* GetTypeName(int x);
	};
	char* CGliderType::GetTypeName(int x)
	{
		if (x == 1)
		{
			return "CLUB";
		}
		if (x == 2)
		{
			return "STANDARD";
		}
		if (x == 3)
		{
			return "DUAL_SEATS";
		}
		if (x == 4)
		{
			return "OPEN";
		}

	}
}