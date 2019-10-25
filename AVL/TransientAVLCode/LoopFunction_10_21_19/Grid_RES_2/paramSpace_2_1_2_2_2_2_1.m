function [aeroForces] = paramSpace_2_1_2_2_2_2_1(sailStates,airStates)

	CL = (4.053687)*sailStates.alpha + (0.175315)*sailStates.beta + (-2.351047)*sailStates.p + (34.514210)*sailStates.q + (1.048286)*sailStates.r + (0.010922)*sailStates.de;
	CD = -0.079990;
	CY = (0.035721)*sailStates.alpha + (-0.024102)*sailStates.beta + (0.333726)*sailStates.p + (0.513811)*sailStates.q + (-0.043899)*sailStates.r + (0.000109)*sailStates.de;

	Cl = (1.166134)*sailStates.alpha + (-0.141950)*sailStates.beta + (-1.060682)*sailStates.p + (8.905389)*sailStates.q + (0.852969)*sailStates.r + (0.000165)*sailStates.de;
	Cm = (-13.502418)*sailStates.alpha + (-0.699124)*sailStates.beta + (7.663916)*sailStates.p + (-130.467148)*sailStates.q + (-3.556809)*sailStates.r + (-0.068233)*sailStates.de;
	Cn = (0.044948)*sailStates.alpha + (0.023884)*sailStates.beta + (-0.641914)*sailStates.p + (2.043466)*sailStates.q + (-0.009589)*sailStates.r + (-0.000105)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end