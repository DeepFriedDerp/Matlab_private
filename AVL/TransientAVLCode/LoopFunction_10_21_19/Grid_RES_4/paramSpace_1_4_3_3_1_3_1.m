function [aeroForces] = paramSpace_1_4_3_3_1_3_1(sailStates,airStates)

	CL = (3.950362)*sailStates.alpha + (0.009315)*sailStates.beta + (-2.175442)*sailStates.p + (30.442745)*sailStates.q + (-0.087348)*sailStates.r + (0.009944)*sailStates.de;
	CD = -0.129860;
	CY = (-0.102562)*sailStates.alpha + (-0.026893)*sailStates.beta + (0.198965)*sailStates.p + (-0.684400)*sailStates.q + (0.039552)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.023414)*sailStates.alpha + (-0.071199)*sailStates.beta + (-0.894631)*sailStates.p + (6.614183)*sailStates.q + (0.147483)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-14.640115)*sailStates.alpha + (0.020991)*sailStates.beta + (7.904451)*sailStates.p + (-127.495163)*sailStates.q + (0.351719)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.393813)*sailStates.alpha + (-0.006917)*sailStates.beta + (-0.572614)*sailStates.p + (3.468495)*sailStates.q + (-0.049174)*sailStates.r + (0.000235)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end