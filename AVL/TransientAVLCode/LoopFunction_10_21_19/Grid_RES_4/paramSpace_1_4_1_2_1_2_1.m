function [aeroForces] = paramSpace_1_4_1_2_1_2_1(sailStates,airStates)

	CL = (3.665277)*sailStates.alpha + (0.186071)*sailStates.beta + (-2.095266)*sailStates.p + (31.658270)*sailStates.q + (-0.641118)*sailStates.r + (0.010167)*sailStates.de;
	CD = 0.091530;
	CY = (-0.116994)*sailStates.alpha + (-0.028480)*sailStates.beta + (-0.073393)*sailStates.p + (-1.057313)*sailStates.q + (-0.014485)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (0.848822)*sailStates.alpha + (0.112055)*sailStates.beta + (-0.802459)*sailStates.p + (6.138614)*sailStates.q + (-0.410638)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-13.164636)*sailStates.alpha + (-0.770523)*sailStates.beta + (7.103666)*sailStates.p + (-124.043571)*sailStates.q + (2.212953)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.144523)*sailStates.alpha + (0.021417)*sailStates.beta + (0.057701)*sailStates.p + (0.989001)*sailStates.q + (-0.038888)*sailStates.r + (0.000308)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end