function [aeroForces] = paramSpace_9_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.283952)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.367692)*sailStates.p + (33.583584)*sailStates.q + (0.794084)*sailStates.r + (0.011090)*sailStates.de;
	CD = -0.139500;
	CY = (-0.077703)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.333806)*sailStates.p + (-0.381223)*sailStates.q + (-0.011617)*sailStates.r + (-0.000082)*sailStates.de;

	Cl = (1.251527)*sailStates.alpha + (-0.151471)*sailStates.beta + (-1.039019)*sailStates.p + (8.256906)*sailStates.q + (0.663922)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.783375)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.012857)*sailStates.p + (-131.546402)*sailStates.q + (-2.663161)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (0.266556)*sailStates.alpha + (0.005289)*sailStates.beta + (-0.723631)*sailStates.p + (3.610512)*sailStates.q + (0.003039)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end