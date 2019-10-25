function [aeroForces] = paramSpace_1_2_2_1_1_2_2(sailStates,airStates)

	CL = (7.762332)*sailStates.alpha + (-0.510414)*sailStates.beta + (-2.551300)*sailStates.p + (29.651373)*sailStates.q + (0.138578)*sailStates.r + (0.008880)*sailStates.de;
	CD = -4.537060;
	CY = (1.913421)*sailStates.alpha + (-0.004663)*sailStates.beta + (-0.314585)*sailStates.p + (15.603146)*sailStates.q + (-0.036995)*sailStates.r + (0.003321)*sailStates.de;

	Cl = (-1.605072)*sailStates.alpha + (-0.474275)*sailStates.beta + (-1.349390)*sailStates.p + (11.175179)*sailStates.q + (0.832198)*sailStates.r + (0.000297)*sailStates.de;
	Cm = (-13.879400)*sailStates.alpha + (2.532424)*sailStates.beta + (9.098241)*sailStates.p + (-137.196289)*sailStates.q + (-0.741945)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (-1.974362)*sailStates.alpha + (-0.071336)*sailStates.beta + (0.107712)*sailStates.p + (-11.815949)*sailStates.q + (0.137997)*sailStates.r + (-0.004448)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end