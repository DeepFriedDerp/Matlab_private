function [aeroForces] = paramSpace_1_2_3_2_1_1_3(sailStates,airStates)

	CL = (4.239360)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.983646)*sailStates.p + (41.571350)*sailStates.q + (-1.831413)*sailStates.r + (0.011703)*sailStates.de;
	CD = -0.361840;
	CY = (-0.163976)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.570893)*sailStates.p + (-0.491416)*sailStates.q + (-0.100711)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.307917)*sailStates.alpha + (0.305053)*sailStates.beta + (-1.529927)*sailStates.p + (13.756322)*sailStates.q + (-1.473586)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-12.492988)*sailStates.alpha + (0.000000)*sailStates.beta + (9.237756)*sailStates.p + (-147.390610)*sailStates.q + (6.096431)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.483009)*sailStates.alpha + (0.053789)*sailStates.beta + (1.090152)*sailStates.p + (-3.743333)*sailStates.q + (-0.020169)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end