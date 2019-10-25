function [aeroForces] = paramSpace_1_1_1_3_1_2_3(sailStates,airStates)

	CL = (3.738366)*sailStates.alpha + (-0.182297)*sailStates.beta + (-2.750741)*sailStates.p + (37.120090)*sailStates.q + (-0.850001)*sailStates.r + (0.010629)*sailStates.de;
	CD = 0.091530;
	CY = (-0.058178)*sailStates.alpha + (-0.023950)*sailStates.beta + (-0.165630)*sailStates.p + (-0.318252)*sailStates.q + (-0.029175)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.305333)*sailStates.alpha + (0.041745)*sailStates.beta + (-1.424035)*sailStates.p + (12.311071)*sailStates.q + (-0.609430)*sailStates.r + (0.000809)*sailStates.de;
	Cm = (-13.385913)*sailStates.alpha + (0.729164)*sailStates.beta + (9.221217)*sailStates.p + (-142.287766)*sailStates.q + (2.901660)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.277595)*sailStates.alpha + (0.012014)*sailStates.beta + (0.150171)*sailStates.p + (0.543168)*sailStates.q + (-0.036965)*sailStates.r + (0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end