function [aeroForces] = paramSpace_3_1_3_2_1_3_2(sailStates,airStates)

	CL = (4.788899)*sailStates.alpha + (0.343059)*sailStates.beta + (-2.565591)*sailStates.p + (35.961246)*sailStates.q + (1.545452)*sailStates.r + (0.011098)*sailStates.de;
	CD = -0.614970;
	CY = (-0.098822)*sailStates.alpha + (-0.025688)*sailStates.beta + (0.683705)*sailStates.p + (-0.769435)*sailStates.q + (-0.044839)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.675004)*sailStates.alpha + (-0.206697)*sailStates.beta + (-1.251140)*sailStates.p + (10.649066)*sailStates.q + (1.350423)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.316910)*sailStates.alpha + (-1.337069)*sailStates.beta + (8.375815)*sailStates.p + (-135.788696)*sailStates.q + (-5.238301)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.213901)*sailStates.alpha + (0.022606)*sailStates.beta + (-1.434953)*sailStates.p + (6.788980)*sailStates.q + (0.010911)*sailStates.r + (0.000333)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end