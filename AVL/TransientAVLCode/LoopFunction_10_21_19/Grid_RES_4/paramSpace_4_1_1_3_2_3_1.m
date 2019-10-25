function [aeroForces] = paramSpace_4_1_1_3_2_3_1(sailStates,airStates)

	CL = (4.151221)*sailStates.alpha + (0.312567)*sailStates.beta + (-2.261507)*sailStates.p + (35.133919)*sailStates.q + (1.527067)*sailStates.r + (0.010939)*sailStates.de;
	CD = -0.184130;
	CY = (-0.026880)*sailStates.alpha + (-0.024227)*sailStates.beta + (0.470664)*sailStates.p + (0.194784)*sailStates.q + (-0.093642)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.220373)*sailStates.alpha + (-0.142948)*sailStates.beta + (-1.011948)*sailStates.p + (9.055300)*sailStates.q + (1.177561)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-12.796989)*sailStates.alpha + (-1.078877)*sailStates.beta + (6.881093)*sailStates.p + (-126.796555)*sailStates.q + (-5.058378)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (0.158461)*sailStates.alpha + (0.047837)*sailStates.beta + (-0.930346)*sailStates.p + (3.581461)*sailStates.q + (-0.009363)*sailStates.r + (0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end