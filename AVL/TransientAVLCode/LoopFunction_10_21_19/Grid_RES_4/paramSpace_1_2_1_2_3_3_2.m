function [aeroForces] = paramSpace_1_2_1_2_3_3_2(sailStates,airStates)

	CL = (3.985142)*sailStates.alpha + (-0.008529)*sailStates.beta + (-2.379636)*sailStates.p + (31.877201)*sailStates.q + (-0.169628)*sailStates.r + (0.009786)*sailStates.de;
	CD = -0.180320;
	CY = (0.090523)*sailStates.alpha + (-0.025859)*sailStates.beta + (0.105163)*sailStates.p + (0.756269)*sailStates.q + (0.020837)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.210763)*sailStates.alpha + (-0.086330)*sailStates.beta + (-1.140022)*sailStates.p + (9.196954)*sailStates.q + (0.073892)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-14.547197)*sailStates.alpha + (0.040461)*sailStates.beta + (8.566811)*sailStates.p + (-133.768066)*sailStates.q + (0.650006)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.183071)*sailStates.alpha + (-0.017879)*sailStates.beta + (-0.474858)*sailStates.p + (2.402521)*sailStates.q + (-0.034754)*sailStates.r + (-0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end