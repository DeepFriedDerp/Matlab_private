function [aeroForces] = paramSpace_6_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.464438)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.123865)*sailStates.p + (40.712521)*sailStates.q + (-1.449436)*sailStates.r + (0.011664)*sailStates.de;
	CD = -0.595420;
	CY = (-0.223296)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.542744)*sailStates.p + (-0.839974)*sailStates.q + (-0.037982)*sailStates.r + (-0.000183)*sailStates.de;

	Cl = (1.359204)*sailStates.alpha + (0.305313)*sailStates.beta + (-1.642913)*sailStates.p + (14.079967)*sailStates.q + (-1.281023)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-13.327624)*sailStates.alpha + (0.000000)*sailStates.beta + (10.274198)*sailStates.p + (-151.784744)*sailStates.q + (4.909326)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (0.489219)*sailStates.alpha + (0.021350)*sailStates.beta + (1.149014)*sailStates.p + (-4.261094)*sailStates.q + (-0.001168)*sailStates.r + (0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end