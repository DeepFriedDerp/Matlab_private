function [aeroForces] = paramSpace_1_4_4_2_3_2_1(sailStates,airStates)

	CL = (3.907305)*sailStates.alpha + (0.178857)*sailStates.beta + (-2.052425)*sailStates.p + (31.763693)*sailStates.q + (-1.004828)*sailStates.r + (0.010417)*sailStates.de;
	CD = 0.020530;
	CY = (0.105077)*sailStates.alpha + (-0.023479)*sailStates.beta + (-0.270985)*sailStates.p + (0.455227)*sailStates.q + (-0.053853)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (0.956277)*sailStates.alpha + (0.175655)*sailStates.beta + (-0.775585)*sailStates.p + (6.210749)*sailStates.q + (-0.659697)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-13.588766)*sailStates.alpha + (-0.556226)*sailStates.beta + (6.612378)*sailStates.p + (-121.885399)*sailStates.q + (3.329373)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.235839)*sailStates.alpha + (0.022261)*sailStates.beta + (0.500350)*sailStates.p + (-2.418906)*sailStates.q + (-0.001368)*sailStates.r + (-0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end