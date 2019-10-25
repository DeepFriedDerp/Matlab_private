function [aeroForces] = paramSpace_3_1_4_3_2_1_2(sailStates,airStates)

	CL = (4.114357)*sailStates.alpha + (-0.051060)*sailStates.beta + (-2.529740)*sailStates.p + (33.946674)*sailStates.q + (-0.308574)*sailStates.r + (0.010672)*sailStates.de;
	CD = -0.122150;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.211006)*sailStates.p + (-0.000000)*sailStates.q + (0.013830)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.347998)*sailStates.alpha + (0.085243)*sailStates.beta + (-1.242122)*sailStates.p + (10.111360)*sailStates.q + (-0.344624)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.663713)*sailStates.alpha + (0.141722)*sailStates.beta + (8.830015)*sailStates.p + (-136.150452)*sailStates.q + (1.014649)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.153667)*sailStates.alpha + (-0.008425)*sailStates.beta + (0.561577)*sailStates.p + (-2.937415)*sailStates.q + (-0.009128)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end