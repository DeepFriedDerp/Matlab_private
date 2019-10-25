function [aeroForces] = paramSpace_1_2_2_1_3_1_3(sailStates,airStates)

	CL = (7.561415)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.470349)*sailStates.p + (49.789658)*sailStates.q + (-3.861487)*sailStates.r + (0.012614)*sailStates.de;
	CD = -3.103180;
	CY = (-0.253856)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.595293)*sailStates.p + (2.260757)*sailStates.q + (-0.281293)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (3.207814)*sailStates.alpha + (0.707466)*sailStates.beta + (-1.900257)*sailStates.p + (18.559534)*sailStates.q + (-3.293567)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-12.559569)*sailStates.alpha + (-0.000001)*sailStates.beta + (9.295492)*sailStates.p + (-157.393341)*sailStates.q + (12.816566)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (1.858182)*sailStates.alpha + (0.124745)*sailStates.beta + (3.254367)*sailStates.p + (-15.126625)*sailStates.q + (0.052169)*sailStates.r + (-0.000966)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end