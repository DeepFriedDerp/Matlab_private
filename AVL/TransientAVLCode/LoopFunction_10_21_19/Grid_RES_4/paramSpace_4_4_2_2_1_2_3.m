function [aeroForces] = paramSpace_4_4_2_2_1_2_3(sailStates,airStates)

	CL = (3.882487)*sailStates.alpha + (-0.242223)*sailStates.beta + (-2.826800)*sailStates.p + (38.416519)*sailStates.q + (1.323891)*sailStates.r + (0.010708)*sailStates.de;
	CD = 0.035500;
	CY = (-0.071624)*sailStates.alpha + (-0.021531)*sailStates.beta + (0.380794)*sailStates.p + (-1.057313)*sailStates.q + (-0.075707)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.347303)*sailStates.alpha + (-0.235315)*sailStates.beta + (-1.411369)*sailStates.p + (12.338573)*sailStates.q + (0.937537)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-13.453166)*sailStates.alpha + (0.829647)*sailStates.beta + (9.106694)*sailStates.p + (-143.598221)*sailStates.q + (-4.406327)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.180659)*sailStates.alpha + (0.029318)*sailStates.beta + (-0.594716)*sailStates.p + (2.587914)*sailStates.q + (-0.012441)*sailStates.r + (0.000358)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end