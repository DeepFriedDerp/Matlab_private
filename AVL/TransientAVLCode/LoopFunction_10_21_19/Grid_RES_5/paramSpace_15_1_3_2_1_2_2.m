function [aeroForces] = paramSpace_15_1_3_2_1_2_2(sailStates,airStates)

	CL = (4.097834)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.667383)*sailStates.p + (39.765198)*sailStates.q + (1.973739)*sailStates.r + (0.010924)*sailStates.de;
	CD = -0.144060;
	CY = (-0.024211)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.619805)*sailStates.p + (-0.596613)*sailStates.q + (-0.154556)*sailStates.r + (-0.000126)*sailStates.de;

	Cl = (1.433436)*sailStates.alpha + (-0.286457)*sailStates.beta + (-1.309792)*sailStates.p + (12.278120)*sailStates.q + (1.521500)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-12.147822)*sailStates.alpha + (0.000000)*sailStates.beta + (7.844441)*sailStates.p + (-138.535995)*sailStates.q + (-6.520113)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (-0.213925)*sailStates.alpha + (0.071422)*sailStates.beta + (-1.122035)*sailStates.p + (4.322719)*sailStates.q + (-0.018178)*sailStates.r + (0.000258)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end