function [aeroForces] = paramSpace_1_1_2_1_1_2_3(sailStates,airStates)

	CL = (3.413142)*sailStates.alpha + (-0.146622)*sailStates.beta + (-3.389657)*sailStates.p + (42.000999)*sailStates.q + (-0.750696)*sailStates.r + (0.011069)*sailStates.de;
	CD = 0.070730;
	CY = (-0.141954)*sailStates.alpha + (-0.022105)*sailStates.beta + (-0.024342)*sailStates.p + (-1.081941)*sailStates.q + (-0.004292)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.273886)*sailStates.alpha + (0.002621)*sailStates.beta + (-1.941440)*sailStates.p + (17.004015)*sailStates.q + (-0.505693)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-12.497958)*sailStates.alpha + (0.534816)*sailStates.beta + (11.568803)*sailStates.p + (-160.704926)*sailStates.q + (2.563914)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (0.416302)*sailStates.alpha + (0.000530)*sailStates.beta + (-0.223409)*sailStates.p + (3.124395)*sailStates.q + (-0.068199)*sailStates.r + (0.000313)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end