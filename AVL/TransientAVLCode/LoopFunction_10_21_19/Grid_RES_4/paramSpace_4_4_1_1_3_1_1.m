function [aeroForces] = paramSpace_4_4_1_1_3_1_1(sailStates,airStates)

	CL = (6.513772)*sailStates.alpha + (0.454400)*sailStates.beta + (-1.488865)*sailStates.p + (19.471313)*sailStates.q + (-2.052796)*sailStates.r + (0.008682)*sailStates.de;
	CD = -2.709870;
	CY = (0.680200)*sailStates.alpha + (-0.031466)*sailStates.beta + (-1.203025)*sailStates.p + (2.326708)*sailStates.q + (0.239047)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (1.759310)*sailStates.alpha + (0.649346)*sailStates.beta + (-0.384690)*sailStates.p + (0.316104)*sailStates.q + (-2.090090)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-18.488634)*sailStates.alpha + (-1.810600)*sailStates.beta + (7.411907)*sailStates.p + (-112.315697)*sailStates.q + (6.691542)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-2.664977)*sailStates.alpha + (-0.082566)*sailStates.beta + (2.703077)*sailStates.p + (-13.712295)*sailStates.q + (-0.106716)*sailStates.r + (-0.000835)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end