function [aeroForces] = paramSpace_1_2_1_1_1_1_3(sailStates,airStates)

	CL = (5.099990)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.557311)*sailStates.p + (49.358532)*sailStates.q + (-3.015216)*sailStates.r + (0.012534)*sailStates.de;
	CD = -1.886710;
	CY = (-0.563331)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.081752)*sailStates.p + (-1.081940)*sailStates.q + (-0.190639)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (1.157996)*sailStates.alpha + (0.584026)*sailStates.beta + (-1.954612)*sailStates.p + (18.407106)*sailStates.q + (-2.621149)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-8.840072)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.300554)*sailStates.p + (-161.621323)*sailStates.q + (10.095461)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (1.779379)*sailStates.alpha + (0.102979)*sailStates.beta + (2.166077)*sailStates.p + (-7.559650)*sailStates.q + (-0.019936)*sailStates.r + (0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end