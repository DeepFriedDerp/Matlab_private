function [aeroForces] = paramSpace_1_2_2_3_1_2_3(sailStates,airStates)

	CL = (3.844557)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.768584)*sailStates.p + (37.300495)*sailStates.q + (-0.844137)*sailStates.r + (0.010880)*sailStates.de;
	CD = 0.071540;
	CY = (-0.056445)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.147536)*sailStates.p + (-0.318252)*sailStates.q + (-0.026015)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.269639)*sailStates.alpha + (0.086463)*sailStates.beta + (-1.390110)*sailStates.p + (11.844877)*sailStates.q + (-0.574433)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-13.815311)*sailStates.alpha + (0.000000)*sailStates.beta + (9.289611)*sailStates.p + (-143.204193)*sailStates.q + (2.852736)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.250887)*sailStates.alpha + (0.015246)*sailStates.beta + (0.130289)*sailStates.p + (0.460386)*sailStates.q + (-0.035094)*sailStates.r + (0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end