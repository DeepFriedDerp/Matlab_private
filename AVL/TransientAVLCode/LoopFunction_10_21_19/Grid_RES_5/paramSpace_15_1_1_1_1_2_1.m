function [aeroForces] = paramSpace_15_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.226042)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.037084)*sailStates.p + (37.059460)*sailStates.q + (2.511994)*sailStates.r + (0.011439)*sailStates.de;
	CD = -1.007560;
	CY = (-0.275126)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.914877)*sailStates.p + (-0.476206)*sailStates.q + (-0.228053)*sailStates.r + (-0.000099)*sailStates.de;

	Cl = (1.562465)*sailStates.alpha + (-0.438717)*sailStates.beta + (-0.758912)*sailStates.p + (7.647347)*sailStates.q + (2.008602)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-11.180845)*sailStates.alpha + (-0.000001)*sailStates.beta + (4.866781)*sailStates.p + (-118.206032)*sailStates.q + (-8.181428)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (1.020921)*sailStates.alpha + (0.109384)*sailStates.beta + (-1.967234)*sailStates.p + (8.882946)*sailStates.q + (0.036551)*sailStates.r + (0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end