function [aeroForces] = paramSpace_1_1_3_1_2_1_1(sailStates,airStates)

	CL = (5.199440)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.036335)*sailStates.p + (37.118561)*sailStates.q + (-2.519800)*sailStates.r + (0.011335)*sailStates.de;
	CD = -1.015460;
	CY = (0.278269)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.928893)*sailStates.p + (0.476207)*sailStates.q + (-0.231582)*sailStates.r + (0.000099)*sailStates.de;

	Cl = (1.567924)*sailStates.alpha + (0.445729)*sailStates.beta + (-0.758535)*sailStates.p + (7.650110)*sailStates.q + (-2.031410)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-10.937697)*sailStates.alpha + (-0.000000)*sailStates.beta + (4.856178)*sailStates.p + (-118.206032)*sailStates.q + (8.223952)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (-1.028239)*sailStates.alpha + (0.111133)*sailStates.beta + (1.988562)*sailStates.p + (-8.894030)*sailStates.q + (0.036429)*sailStates.r + (-0.000274)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end