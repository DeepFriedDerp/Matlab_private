function [aeroForces] = paramSpace_3_2_1_2_2_3_3(sailStates,airStates)

	CL = (4.511682)*sailStates.alpha + (0.093298)*sailStates.beta + (-2.995625)*sailStates.p + (39.410255)*sailStates.q + (1.381280)*sailStates.r + (0.011533)*sailStates.de;
	CD = -0.457730;
	CY = (0.078235)*sailStates.alpha + (-0.025002)*sailStates.beta + (0.546156)*sailStates.p + (-0.100923)*sailStates.q + (-0.035786)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.549152)*sailStates.alpha + (-0.238426)*sailStates.beta + (-1.561454)*sailStates.p + (13.355124)*sailStates.q + (1.180533)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.088483)*sailStates.alpha + (-0.331760)*sailStates.beta + (9.880480)*sailStates.p + (-148.239975)*sailStates.q + (-4.645819)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.257848)*sailStates.alpha + (0.017948)*sailStates.beta + (-1.149966)*sailStates.p + (5.093338)*sailStates.q + (0.004445)*sailStates.r + (0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end