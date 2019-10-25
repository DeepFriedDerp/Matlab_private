function [aeroForces] = paramSpace_1_1_3_1_3_2_1(sailStates,airStates)

	CL = (3.836946)*sailStates.alpha + (-0.153720)*sailStates.beta + (-1.582468)*sailStates.p + (27.950502)*sailStates.q + (-0.989114)*sailStates.r + (0.010318)*sailStates.de;
	CD = -0.044970;
	CY = (0.272218)*sailStates.alpha + (-0.027289)*sailStates.beta + (-0.350630)*sailStates.p + (1.081941)*sailStates.q + (-0.061723)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.816438)*sailStates.alpha + (0.079939)*sailStates.beta + (-0.476996)*sailStates.p + (3.696622)*sailStates.q + (-0.679731)*sailStates.r + (-0.000764)*sailStates.de;
	Cm = (-12.973201)*sailStates.alpha + (0.481539)*sailStates.beta + (4.960799)*sailStates.p + (-108.520653)*sailStates.q + (3.272511)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-0.688496)*sailStates.alpha + (0.026894)*sailStates.beta + (0.723976)*sailStates.p + (-4.132050)*sailStates.q + (0.022259)*sailStates.r + (-0.000350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end