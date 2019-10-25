function [aeroForces] = paramSpace_1_3_2_2_3_2_1(sailStates,airStates)

	CL = (3.904505)*sailStates.alpha + (0.169511)*sailStates.beta + (-2.074886)*sailStates.p + (31.823050)*sailStates.q + (-0.930872)*sailStates.r + (0.010419)*sailStates.de;
	CD = 0.025250;
	CY = (0.109906)*sailStates.alpha + (-0.023593)*sailStates.beta + (-0.275385)*sailStates.p + (0.491415)*sailStates.q + (-0.048558)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (0.978051)*sailStates.alpha + (0.165887)*sailStates.beta + (-0.791468)*sailStates.p + (6.266479)*sailStates.q + (-0.639286)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-13.583393)*sailStates.alpha + (-0.608490)*sailStates.beta + (6.756083)*sailStates.p + (-122.751358)*sailStates.q + (3.117424)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.237161)*sailStates.alpha + (0.019569)*sailStates.beta + (0.501072)*sailStates.p + (-2.350398)*sailStates.q + (0.000237)*sailStates.r + (-0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end