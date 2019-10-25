function [aeroForces] = paramSpace_10_1_2_1_1_2_1(sailStates,airStates)

	CL = (5.209502)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.082887)*sailStates.p + (32.556721)*sailStates.q + (1.817397)*sailStates.r + (0.011161)*sailStates.de;
	CD = -0.978530;
	CY = (-0.282616)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.814413)*sailStates.p + (-0.839976)*sailStates.q + (-0.056920)*sailStates.r + (-0.000180)*sailStates.de;

	Cl = (1.507223)*sailStates.alpha + (-0.373265)*sailStates.beta + (-0.796576)*sailStates.p + (6.378978)*sailStates.q + (1.581458)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.254536)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.631572)*sailStates.p + (-122.784714)*sailStates.q + (-6.137830)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (1.043602)*sailStates.alpha + (0.026101)*sailStates.beta + (-1.765468)*sailStates.p + (8.574701)*sailStates.q + (0.016706)*sailStates.r + (0.000375)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end