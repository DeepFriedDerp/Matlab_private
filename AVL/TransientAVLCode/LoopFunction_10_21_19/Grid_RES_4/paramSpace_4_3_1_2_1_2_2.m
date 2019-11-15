function [aeroForces] = paramSpace_4_3_1_2_1_2_2(sailStates,airStates)

	CL = (4.036270)*sailStates.alpha + (-0.067283)*sailStates.beta + (-2.458911)*sailStates.p + (35.333786)*sailStates.q + (1.167214)*sailStates.r + (0.010763)*sailStates.de;
	CD = 0.025190;
	CY = (-0.098257)*sailStates.alpha + (-0.024251)*sailStates.beta + (0.320195)*sailStates.p + (-0.756270)*sailStates.q + (-0.063609)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.268947)*sailStates.alpha + (-0.154925)*sailStates.beta + (-1.133956)*sailStates.p + (9.744391)*sailStates.q + (0.797885)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-14.038505)*sailStates.alpha + (0.210789)*sailStates.beta + (7.927005)*sailStates.p + (-133.768066)*sailStates.q + (-3.866526)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.026628)*sailStates.alpha + (0.025825)*sailStates.beta + (-0.532525)*sailStates.p + (2.424293)*sailStates.q + (-0.008333)*sailStates.r + (0.000272)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end