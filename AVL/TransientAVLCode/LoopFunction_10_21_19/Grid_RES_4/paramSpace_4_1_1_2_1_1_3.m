function [aeroForces] = paramSpace_4_1_1_2_1_1_3(sailStates,airStates)

	CL = (4.016767)*sailStates.alpha + (-0.015744)*sailStates.beta + (-2.750402)*sailStates.p + (34.765636)*sailStates.q + (0.292172)*sailStates.r + (0.010084)*sailStates.de;
	CD = -0.235110;
	CY = (-0.144307)*sailStates.alpha + (-0.027822)*sailStates.beta + (-0.102327)*sailStates.p + (-1.057314)*sailStates.q + (0.020468)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.361142)*sailStates.alpha + (0.116312)*sailStates.beta + (-1.481744)*sailStates.p + (12.573177)*sailStates.q + (-0.015963)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-14.627731)*sailStates.alpha + (0.210270)*sailStates.beta + (9.785781)*sailStates.p + (-143.598221)*sailStates.q + (-0.992325)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.062593)*sailStates.alpha + (-0.023808)*sailStates.beta + (0.512169)*sailStates.p + (-2.440832)*sailStates.q + (-0.040587)*sailStates.r + (0.000275)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end