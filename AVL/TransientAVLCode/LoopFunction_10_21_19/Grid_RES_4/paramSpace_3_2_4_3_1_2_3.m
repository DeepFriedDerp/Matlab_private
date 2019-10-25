function [aeroForces] = paramSpace_3_2_4_3_1_2_3(sailStates,airStates)

	CL = (4.029078)*sailStates.alpha + (0.041731)*sailStates.beta + (-2.821479)*sailStates.p + (37.129898)*sailStates.q + (0.511474)*sailStates.r + (0.011122)*sailStates.de;
	CD = 0.034570;
	CY = (-0.050417)*sailStates.alpha + (-0.025237)*sailStates.beta + (0.189261)*sailStates.p + (-0.563442)*sailStates.q + (-0.012464)*sailStates.r + (-0.000122)*sailStates.de;

	Cl = (1.401280)*sailStates.alpha + (-0.060077)*sailStates.beta + (-1.433631)*sailStates.p + (11.971063)*sailStates.q + (0.400247)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.497556)*sailStates.alpha + (-0.179498)*sailStates.beta + (9.562968)*sailStates.p + (-144.107025)*sailStates.q + (-1.758750)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.035418)*sailStates.alpha + (0.004855)*sailStates.beta + (-0.307159)*sailStates.p + (1.372214)*sailStates.q + (-0.000132)*sailStates.r + (0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end