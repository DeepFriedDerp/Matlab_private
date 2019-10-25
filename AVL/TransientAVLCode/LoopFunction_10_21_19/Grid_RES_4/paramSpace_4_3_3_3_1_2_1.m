function [aeroForces] = paramSpace_4_3_3_3_1_2_1(sailStates,airStates)

	CL = (3.894706)*sailStates.alpha + (-0.073400)*sailStates.beta + (-2.214706)*sailStates.p + (33.250031)*sailStates.q + (1.014901)*sailStates.r + (0.010469)*sailStates.de;
	CD = 0.052290;
	CY = (-0.068679)*sailStates.alpha + (-0.024652)*sailStates.beta + (0.275727)*sailStates.p + (-0.294836)*sailStates.q + (-0.054856)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.094840)*sailStates.alpha + (-0.146718)*sailStates.beta + (-0.932389)*sailStates.p + (7.753262)*sailStates.q + (0.706142)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-13.525557)*sailStates.alpha + (0.273245)*sailStates.beta + (7.189710)*sailStates.p + (-127.124184)*sailStates.q + (-3.406591)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.096908)*sailStates.alpha + (0.025197)*sailStates.beta + (-0.462917)*sailStates.p + (1.788978)*sailStates.q + (-0.011501)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end