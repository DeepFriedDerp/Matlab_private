function [aeroForces] = paramSpace_2_3_1_3_3_2_3(sailStates,airStates)

	CL = (4.029078)*sailStates.alpha + (0.041731)*sailStates.beta + (-2.821479)*sailStates.p + (37.129898)*sailStates.q + (-0.511474)*sailStates.r + (0.011122)*sailStates.de;
	CD = 0.034570;
	CY = (0.050417)*sailStates.alpha + (-0.024716)*sailStates.beta + (-0.189261)*sailStates.p + (0.563442)*sailStates.q + (-0.012464)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.354830)*sailStates.alpha + (0.083317)*sailStates.beta + (-1.400985)*sailStates.p + (11.567185)*sailStates.q + (-0.398065)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.497555)*sailStates.alpha + (-0.179498)*sailStates.beta + (9.562969)*sailStates.p + (-144.107040)*sailStates.q + (1.758750)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.026078)*sailStates.alpha + (0.004543)*sailStates.beta + (0.309299)*sailStates.p + (-1.398685)*sailStates.q + (0.000011)*sailStates.r + (-0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end