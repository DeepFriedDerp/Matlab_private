function [aeroForces] = paramSpace_10_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.503641)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.104067)*sailStates.p + (32.424141)*sailStates.q + (1.299329)*sailStates.r + (0.011196)*sailStates.de;
	CD = -0.567900;
	CY = (0.040450)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.483881)*sailStates.p + (1.113124)*sailStates.q + (-0.033954)*sailStates.r + (0.000238)*sailStates.de;

	Cl = (0.930843)*sailStates.alpha + (-0.286922)*sailStates.beta + (-0.809734)*sailStates.p + (6.341772)*sailStates.q + (1.141261)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-13.522395)*sailStates.alpha + (0.000000)*sailStates.beta + (6.873923)*sailStates.p + (-123.764404)*sailStates.q + (-4.390343)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (0.482117)*sailStates.alpha + (0.020064)*sailStates.beta + (-1.094981)*sailStates.p + (4.176502)*sailStates.q + (0.000677)*sailStates.r + (-0.000223)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end