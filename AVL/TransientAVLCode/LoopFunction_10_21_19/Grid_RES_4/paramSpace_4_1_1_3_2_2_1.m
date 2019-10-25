function [aeroForces] = paramSpace_4_1_1_3_2_2_1(sailStates,airStates)

	CL = (3.850624)*sailStates.alpha + (0.159384)*sailStates.beta + (-2.211571)*sailStates.p + (32.804661)*sailStates.q + (0.865846)*sailStates.r + (0.010483)*sailStates.de;
	CD = 0.052010;
	CY = (0.005728)*sailStates.alpha + (-0.024227)*sailStates.beta + (0.167610)*sailStates.p + (0.194782)*sailStates.q + (-0.033361)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.128365)*sailStates.alpha + (-0.035804)*sailStates.beta + (-0.996158)*sailStates.p + (8.440326)*sailStates.q + (0.564261)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-13.729918)*sailStates.alpha + (-0.492202)*sailStates.beta + (7.313507)*sailStates.p + (-126.796555)*sailStates.q + (-2.884483)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.060567)*sailStates.alpha + (0.015065)*sailStates.beta + (-0.240812)*sailStates.p + (0.489776)*sailStates.q + (-0.025181)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end