function [aeroForces] = paramSpace_2_4_1_1_3_3_1(sailStates,airStates)

	CL = (4.983437)*sailStates.alpha + (-0.372515)*sailStates.beta + (-1.587177)*sailStates.p + (24.993660)*sailStates.q + (1.554116)*sailStates.r + (0.009914)*sailStates.de;
	CD = -1.671280;
	CY = (-0.088432)*sailStates.alpha + (-0.022750)*sailStates.beta + (0.715138)*sailStates.p + (1.471502)*sailStates.q + (0.046717)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.385077)*sailStates.alpha + (-0.520716)*sailStates.beta + (-0.398206)*sailStates.p + (1.730080)*sailStates.q + (1.554341)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.364583)*sailStates.alpha + (1.425999)*sailStates.beta + (6.031774)*sailStates.p + (-111.058342)*sailStates.q + (-5.260450)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (1.421297)*sailStates.alpha + (-0.026425)*sailStates.beta + (-1.685066)*sailStates.p + (6.680669)*sailStates.q + (-0.006792)*sailStates.r + (-0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end