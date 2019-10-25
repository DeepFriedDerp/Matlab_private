function [aeroForces] = paramSpace_4_2_3_2_2_1_3(sailStates,airStates)

	CL = (4.050057)*sailStates.alpha + (0.000034)*sailStates.beta + (-2.789988)*sailStates.p + (35.006886)*sailStates.q + (0.124023)*sailStates.r + (0.010070)*sailStates.de;
	CD = -0.272440;
	CY = (-0.068729)*sailStates.alpha + (-0.025307)*sailStates.beta + (-0.191884)*sailStates.p + (-0.301044)*sailStates.q + (0.038157)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.393999)*sailStates.alpha + (0.112150)*sailStates.beta + (-1.472265)*sailStates.p + (12.218102)*sailStates.q + (-0.128456)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-14.594325)*sailStates.alpha + (0.009223)*sailStates.beta + (10.086189)*sailStates.p + (-145.703583)*sailStates.q + (-0.496659)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.143846)*sailStates.alpha + (-0.024280)*sailStates.beta + (0.713544)*sailStates.p + (-4.055650)*sailStates.q + (-0.058126)*sailStates.r + (0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end