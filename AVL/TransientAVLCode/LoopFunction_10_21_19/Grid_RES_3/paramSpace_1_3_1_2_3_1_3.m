function [aeroForces] = paramSpace_1_3_1_2_3_1_3(sailStates,airStates)

	CL = (4.706995)*sailStates.alpha + (0.439192)*sailStates.beta + (-2.924664)*sailStates.p + (41.672089)*sailStates.q + (-2.240750)*sailStates.r + (0.011330)*sailStates.de;
	CD = -0.641460;
	CY = (-0.003831)*sailStates.alpha + (-0.021989)*sailStates.beta + (-0.850945)*sailStates.p + (1.027327)*sailStates.q + (-0.150142)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.725181)*sailStates.alpha + (0.514214)*sailStates.beta + (-1.453819)*sailStates.p + (13.234715)*sailStates.q + (-1.846004)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-12.549888)*sailStates.alpha + (-1.692109)*sailStates.beta + (8.693673)*sailStates.p + (-144.553238)*sailStates.q + (7.489659)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.332064)*sailStates.alpha + (0.063140)*sailStates.beta + (1.662381)*sailStates.p + (-7.307245)*sailStates.q + (0.012713)*sailStates.r + (-0.000422)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end