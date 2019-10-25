function [aeroForces] = paramSpace_1_2_1_2_1_2_1(sailStates,airStates)

	CL = (7.048979)*sailStates.alpha + (-0.422752)*sailStates.beta + (-2.549760)*sailStates.p + (30.153471)*sailStates.q + (0.086106)*sailStates.r + (0.008948)*sailStates.de;
	CD = -3.703790;
	CY = (1.723980)*sailStates.alpha + (-0.000718)*sailStates.beta + (-0.303123)*sailStates.p + (14.079481)*sailStates.q + (-0.037913)*sailStates.r + (0.002997)*sailStates.de;

	Cl = (-0.980076)*sailStates.alpha + (-0.414697)*sailStates.beta + (-1.331209)*sailStates.p + (10.992574)*sailStates.q + (0.705543)*sailStates.r + (0.000294)*sailStates.de;
	Cm = (-14.085845)*sailStates.alpha + (2.055573)*sailStates.beta + (9.060423)*sailStates.p + (-137.144791)*sailStates.q + (-0.502969)*sailStates.r + (-0.068306)*sailStates.de;
	Cn = (-1.717524)*sailStates.alpha + (-0.070958)*sailStates.beta + (0.109614)*sailStates.p + (-10.537517)*sailStates.q + (0.126665)*sailStates.r + (-0.003995)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end