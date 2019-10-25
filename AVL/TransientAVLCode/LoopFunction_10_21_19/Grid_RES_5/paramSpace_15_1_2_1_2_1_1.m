function [aeroForces] = paramSpace_15_1_2_1_2_1_1(sailStates,airStates)

	CL = (4.460836)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.864547)*sailStates.p + (25.385004)*sailStates.q + (-0.579045)*sailStates.r + (0.009136)*sailStates.de;
	CD = -0.741800;
	CY = (0.274016)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.547431)*sailStates.p + (1.423509)*sailStates.q + (0.136438)*sailStates.r + (0.000296)*sailStates.de;

	Cl = (1.195176)*sailStates.alpha + (0.217763)*sailStates.beta + (-0.725250)*sailStates.p + (4.531930)*sailStates.q + (-0.779705)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-16.082184)*sailStates.alpha + (0.000000)*sailStates.beta + (7.769226)*sailStates.p + (-121.603668)*sailStates.q + (1.741374)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (-1.011761)*sailStates.alpha + (-0.054294)*sailStates.beta + (1.353903)*sailStates.p + (-7.478453)*sailStates.q + (-0.098056)*sailStates.r + (-0.000500)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end