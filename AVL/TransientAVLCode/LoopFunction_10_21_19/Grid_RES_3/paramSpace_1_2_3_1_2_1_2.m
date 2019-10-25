function [aeroForces] = paramSpace_1_2_3_1_2_1_2(sailStates,airStates)

	CL = (6.560620)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.655553)*sailStates.p + (42.244675)*sailStates.q + (-3.113857)*sailStates.r + (0.012261)*sailStates.de;
	CD = -2.362190;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.215108)*sailStates.p + (-0.000003)*sailStates.q + (-0.214256)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.954217)*sailStates.alpha + (0.607554)*sailStates.beta + (-1.223163)*sailStates.p + (11.749498)*sailStates.q + (-2.659253)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-11.481912)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.017260)*sailStates.p + (-135.529190)*sailStates.q + (10.332321)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.170241)*sailStates.alpha + (0.107128)*sailStates.beta + (2.595016)*sailStates.p + (-11.165671)*sailStates.q + (0.026559)*sailStates.r + (-0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end