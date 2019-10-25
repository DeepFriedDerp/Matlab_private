function [aeroForces] = paramSpace_1_3_1_3_3_1_2(sailStates,airStates)

	CL = (4.283470)*sailStates.alpha + (0.136258)*sailStates.beta + (-2.514564)*sailStates.p + (37.764893)*sailStates.q + (-1.785743)*sailStates.r + (0.010962)*sailStates.de;
	CD = -0.240460;
	CY = (0.066409)*sailStates.alpha + (-0.024405)*sailStates.beta + (-0.624217)*sailStates.p + (0.489617)*sailStates.q + (-0.124217)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.405820)*sailStates.alpha + (0.330916)*sailStates.beta + (-1.153601)*sailStates.p + (10.352154)*sailStates.q + (-1.425541)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-12.636588)*sailStates.alpha + (-0.529291)*sailStates.beta + (7.556917)*sailStates.p + (-134.148560)*sailStates.q + (5.965690)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.081810)*sailStates.alpha + (0.057381)*sailStates.beta + (1.197994)*sailStates.p + (-4.942853)*sailStates.q + (0.000160)*sailStates.r + (-0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end