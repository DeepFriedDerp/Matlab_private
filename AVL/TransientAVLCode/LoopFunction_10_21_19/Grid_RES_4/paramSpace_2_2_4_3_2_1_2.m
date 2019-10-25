function [aeroForces] = paramSpace_2_2_4_3_2_1_2(sailStates,airStates)

	CL = (4.296821)*sailStates.alpha + (-0.063204)*sailStates.beta + (-2.584059)*sailStates.p + (35.725021)*sailStates.q + (-0.972837)*sailStates.r + (0.011244)*sailStates.de;
	CD = -0.174360;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.361484)*sailStates.p + (-0.000000)*sailStates.q + (-0.023693)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.348001)*sailStates.alpha + (0.159428)*sailStates.beta + (-1.229933)*sailStates.p + (10.193565)*sailStates.q + (-0.804287)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.494965)*sailStates.alpha + (0.215085)*sailStates.beta + (8.616637)*sailStates.p + (-137.194580)*sailStates.q + (3.266202)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.065121)*sailStates.alpha + (0.012022)*sailStates.beta + (0.759886)*sailStates.p + (-3.347132)*sailStates.q + (0.002120)*sailStates.r + (-0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end