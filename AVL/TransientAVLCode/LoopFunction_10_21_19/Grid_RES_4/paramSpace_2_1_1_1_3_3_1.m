function [aeroForces] = paramSpace_2_1_1_1_3_3_1(sailStates,airStates)

	CL = (4.983437)*sailStates.alpha + (0.372515)*sailStates.beta + (-1.587177)*sailStates.p + (24.993660)*sailStates.q + (1.554117)*sailStates.r + (0.009914)*sailStates.de;
	CD = -1.671280;
	CY = (-0.088432)*sailStates.alpha + (-0.026822)*sailStates.beta + (0.715138)*sailStates.p + (1.471502)*sailStates.q + (0.046717)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.578382)*sailStates.alpha + (-0.307901)*sailStates.beta + (-0.495893)*sailStates.p + (2.938639)*sailStates.q + (1.547811)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.364584)*sailStates.alpha + (-1.425999)*sailStates.beta + (6.031774)*sailStates.p + (-111.058342)*sailStates.q + (-5.260450)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (1.324630)*sailStates.alpha + (-0.027885)*sailStates.beta + (-1.691468)*sailStates.p + (6.759882)*sailStates.q + (-0.007220)*sailStates.r + (-0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end