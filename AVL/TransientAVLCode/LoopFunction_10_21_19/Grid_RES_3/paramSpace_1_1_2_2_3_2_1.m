function [aeroForces] = paramSpace_1_1_2_2_3_2_1(sailStates,airStates)

	CL = (3.904505)*sailStates.alpha + (-0.169511)*sailStates.beta + (-2.074886)*sailStates.p + (31.823050)*sailStates.q + (-0.930872)*sailStates.r + (0.010419)*sailStates.de;
	CD = 0.025250;
	CY = (0.109906)*sailStates.alpha + (-0.026069)*sailStates.beta + (-0.275385)*sailStates.p + (0.491415)*sailStates.q + (-0.048558)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.118220)*sailStates.alpha + (0.066023)*sailStates.beta + (-0.876103)*sailStates.p + (7.327347)*sailStates.q + (-0.654210)*sailStates.r + (-0.000110)*sailStates.de;
	Cm = (-13.583393)*sailStates.alpha + (0.608490)*sailStates.beta + (6.756083)*sailStates.p + (-122.751343)*sailStates.q + (3.117424)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.184174)*sailStates.alpha + (0.021323)*sailStates.beta + (0.486148)*sailStates.p + (-2.163339)*sailStates.q + (-0.002395)*sailStates.r + (-0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end