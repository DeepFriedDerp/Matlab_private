function [aeroForces] = paramSpace_3_1_2_1_1_1_1(sailStates,airStates)

	CL = (5.068117)*sailStates.alpha + (-0.413972)*sailStates.beta + (-1.587479)*sailStates.p + (24.961279)*sailStates.q + (-1.568428)*sailStates.r + (0.009973)*sailStates.de;
	CD = -1.740290;
	CY = (0.099197)*sailStates.alpha + (-0.026201)*sailStates.beta + (-0.744351)*sailStates.p + (-1.471499)*sailStates.q + (0.048839)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.564521)*sailStates.alpha + (0.323116)*sailStates.beta + (-0.496083)*sailStates.p + (2.937104)*sailStates.q + (-1.593856)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.484687)*sailStates.alpha + (1.693530)*sailStates.beta + (6.037172)*sailStates.p + (-111.058342)*sailStates.q + (5.342806)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-1.352979)*sailStates.alpha + (-0.029473)*sailStates.beta + (1.734626)*sailStates.p + (-6.783294)*sailStates.q + (-0.007234)*sailStates.r + (0.000297)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end