function [aeroForces] = paramSpace_3_4_1_2_3_1_3(sailStates,airStates)

	CL = (4.562321)*sailStates.alpha + (0.219213)*sailStates.beta + (-2.931165)*sailStates.p + (36.686478)*sailStates.q + (-0.840333)*sailStates.r + (0.010878)*sailStates.de;
	CD = -0.548150;
	CY = (-0.008661)*sailStates.alpha + (-0.025288)*sailStates.beta + (-0.532349)*sailStates.p + (0.668512)*sailStates.q + (0.034821)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.561444)*sailStates.alpha + (0.291948)*sailStates.beta + (-1.475242)*sailStates.p + (11.823302)*sailStates.q + (-0.877670)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-15.030106)*sailStates.alpha + (-0.948954)*sailStates.beta + (10.350533)*sailStates.p + (-147.557632)*sailStates.q + (2.874450)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.020384)*sailStates.alpha + (-0.012946)*sailStates.beta + (1.243180)*sailStates.p + (-6.312502)*sailStates.q + (-0.017844)*sailStates.r + (-0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end