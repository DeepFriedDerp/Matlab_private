function [aeroForces] = paramSpace_4_1_1_2_2_3_2(sailStates,airStates)

	CL = (4.497282)*sailStates.alpha + (0.409975)*sailStates.beta + (-2.539589)*sailStates.p + (38.543537)*sailStates.q + (1.988729)*sailStates.r + (0.011312)*sailStates.de;
	CD = -0.481420;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.667152)*sailStates.p + (-0.000001)*sailStates.q + (-0.132705)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.441336)*sailStates.alpha + (-0.200103)*sailStates.beta + (-1.226387)*sailStates.p + (11.373129)*sailStates.q + (1.594991)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-12.409801)*sailStates.alpha + (-1.445081)*sailStates.beta + (7.455042)*sailStates.p + (-133.820877)*sailStates.q + (-6.578105)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.027751)*sailStates.alpha + (0.066883)*sailStates.beta + (-1.330713)*sailStates.p + (5.322326)*sailStates.q + (-0.004291)*sailStates.r + (0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end