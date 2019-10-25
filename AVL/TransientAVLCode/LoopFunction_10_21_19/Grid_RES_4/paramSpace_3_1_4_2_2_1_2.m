function [aeroForces] = paramSpace_3_1_4_2_2_1_2(sailStates,airStates)

	CL = (4.361772)*sailStates.alpha + (-0.134269)*sailStates.beta + (-2.520436)*sailStates.p + (33.519886)*sailStates.q + (-0.665220)*sailStates.r + (0.010587)*sailStates.de;
	CD = -0.380460;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.379522)*sailStates.p + (-0.000000)*sailStates.q + (0.024875)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.412911)*sailStates.alpha + (0.145507)*sailStates.beta + (-1.239178)*sailStates.p + (9.998679)*sailStates.q + (-0.678294)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.826126)*sailStates.alpha + (0.467949)*sailStates.beta + (8.909245)*sailStates.p + (-136.150452)*sailStates.q + (2.223467)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.211125)*sailStates.alpha + (-0.014494)*sailStates.beta + (0.939966)*sailStates.p + (-4.656580)*sailStates.q + (-0.012056)*sailStates.r + (-0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end