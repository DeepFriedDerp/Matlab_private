function [aeroForces] = paramSpace_2_1_4_3_1_3_2(sailStates,airStates)

	CL = (4.259402)*sailStates.alpha + (0.133256)*sailStates.beta + (-2.535481)*sailStates.p + (33.869804)*sailStates.q + (0.464687)*sailStates.r + (0.010763)*sailStates.de;
	CD = -0.209530;
	CY = (-0.060488)*sailStates.alpha + (-0.024413)*sailStates.beta + (0.336123)*sailStates.p + (-0.498142)*sailStates.q + (0.021978)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.419375)*sailStates.alpha + (-0.116430)*sailStates.beta + (-1.245614)*sailStates.p + (10.100400)*sailStates.q + (0.522406)*sailStates.r + (0.000480)*sailStates.de;
	Cm = (-15.013672)*sailStates.alpha + (-0.612098)*sailStates.beta + (8.897080)*sailStates.p + (-136.384659)*sailStates.q + (-1.599798)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.227273)*sailStates.alpha + (-0.011423)*sailStates.beta + (-0.792812)*sailStates.p + (4.090423)*sailStates.q + (-0.012603)*sailStates.r + (0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end