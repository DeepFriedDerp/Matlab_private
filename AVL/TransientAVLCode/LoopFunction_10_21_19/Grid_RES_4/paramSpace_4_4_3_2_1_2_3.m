function [aeroForces] = paramSpace_4_4_3_2_1_2_3(sailStates,airStates)

	CL = (3.844344)*sailStates.alpha + (-0.262941)*sailStates.beta + (-2.825992)*sailStates.p + (38.465050)*sailStates.q + (1.332877)*sailStates.r + (0.010621)*sailStates.de;
	CD = 0.046970;
	CY = (-0.069137)*sailStates.alpha + (-0.021311)*sailStates.beta + (0.395227)*sailStates.p + (-1.057313)*sailStates.q + (-0.078653)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.349726)*sailStates.alpha + (-0.243507)*sailStates.beta + (-1.410991)*sailStates.p + (12.340765)*sailStates.q + (0.961144)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-13.258865)*sailStates.alpha + (0.962244)*sailStates.beta + (9.096355)*sailStates.p + (-143.598221)*sailStates.q + (-4.458303)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.188706)*sailStates.alpha + (0.030551)*sailStates.beta + (-0.616475)*sailStates.p + (2.598934)*sailStates.q + (-0.012703)*sailStates.r + (0.000346)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end