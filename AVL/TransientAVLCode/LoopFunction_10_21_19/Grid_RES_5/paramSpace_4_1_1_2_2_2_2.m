function [aeroForces] = paramSpace_4_1_1_2_2_2_2(sailStates,airStates)

	CL = (3.947487)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.701822)*sailStates.p + (35.620167)*sailStates.q + (-0.345489)*sailStates.r + (0.010611)*sailStates.de;
	CD = 0.005820;
	CY = (0.063103)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.013763)*sailStates.p + (0.520429)*sailStates.q + (-0.001990)*sailStates.r + (0.000112)*sailStates.de;

	Cl = (1.310278)*sailStates.alpha + (-0.013989)*sailStates.beta + (-1.346236)*sailStates.p + (11.132017)*sailStates.q + (-0.152845)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-14.419720)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.339798)*sailStates.p + (-141.704483)*sailStates.q + (1.205674)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (0.108164)*sailStates.alpha + (-0.001966)*sailStates.beta + (-0.168051)*sailStates.p + (1.113058)*sailStates.q + (-0.018678)*sailStates.r + (-0.000115)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end