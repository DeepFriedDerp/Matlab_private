function [aeroForces] = paramSpace_3_4_4_3_2_1_2(sailStates,airStates)

	CL = (4.114357)*sailStates.alpha + (0.051060)*sailStates.beta + (-2.529740)*sailStates.p + (33.946674)*sailStates.q + (-0.308574)*sailStates.r + (0.010672)*sailStates.de;
	CD = -0.122150;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.211006)*sailStates.p + (-0.000000)*sailStates.q + (0.013830)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.196953)*sailStates.alpha + (0.125630)*sailStates.beta + (-1.144434)*sailStates.p + (8.902802)*sailStates.q + (-0.351154)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.663713)*sailStates.alpha + (-0.141722)*sailStates.beta + (8.830015)*sailStates.p + (-136.150452)*sailStates.q + (1.014649)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.171427)*sailStates.alpha + (-0.005396)*sailStates.beta + (0.555174)*sailStates.p + (-2.858202)*sailStates.q + (-0.008700)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end