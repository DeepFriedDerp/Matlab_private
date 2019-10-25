function [aeroForces] = paramSpace_1_1_1_2_3_3_1(sailStates,airStates)

	CL = (3.860172)*sailStates.alpha + (-0.002016)*sailStates.beta + (-1.973496)*sailStates.p + (28.304985)*sailStates.q + (-0.005235)*sailStates.r + (0.009458)*sailStates.de;
	CD = -0.199560;
	CY = (0.026773)*sailStates.alpha + (-0.026377)*sailStates.beta + (0.155003)*sailStates.p + (0.455226)*sailStates.q + (0.030783)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.013109)*sailStates.alpha + (-0.091517)*sailStates.beta + (-0.844616)*sailStates.p + (6.454225)*sailStates.q + (0.201167)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-14.206711)*sailStates.alpha + (0.040324)*sailStates.beta + (7.254699)*sailStates.p + (-121.885399)*sailStates.q + (0.100205)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.308561)*sailStates.alpha + (-0.022859)*sailStates.beta + (-0.520505)*sailStates.p + (2.565215)*sailStates.q + (-0.030246)*sailStates.r + (-0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end