function [aeroForces] = paramSpace_1_3_2_3_2_1_2(sailStates,airStates)

	CL = (4.172498)*sailStates.alpha + (0.298611)*sailStates.beta + (-2.530403)*sailStates.p + (37.077320)*sailStates.q + (-1.533902)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.189590;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.501272)*sailStates.p + (0.000001)*sailStates.q + (-0.088388)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.233127)*sailStates.alpha + (0.336101)*sailStates.beta + (-1.138531)*sailStates.p + (9.838181)*sailStates.q + (-1.205579)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-12.972332)*sailStates.alpha + (-1.109442)*sailStates.beta + (7.875241)*sailStates.p + (-134.612778)*sailStates.q + (5.127506)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.037726)*sailStates.alpha + (0.043490)*sailStates.beta + (0.969607)*sailStates.p + (-3.802875)*sailStates.q + (-0.006210)*sailStates.r + (-0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end