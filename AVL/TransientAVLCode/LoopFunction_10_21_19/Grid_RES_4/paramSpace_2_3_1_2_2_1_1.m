function [aeroForces] = paramSpace_2_3_1_2_2_1_1(sailStates,airStates)

	CL = (4.528137)*sailStates.alpha + (0.110243)*sailStates.beta + (-2.190476)*sailStates.p + (32.942734)*sailStates.q + (-1.302064)*sailStates.r + (0.011050)*sailStates.de;
	CD = -0.477630;
	CY = (0.080310)*sailStates.alpha + (-0.025023)*sailStates.beta + (-0.558438)*sailStates.p + (-0.100924)*sailStates.q + (-0.036591)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.146423)*sailStates.alpha + (0.310561)*sailStates.beta + (-0.871326)*sailStates.p + (6.855790)*sailStates.q + (-1.164067)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-13.920900)*sailStates.alpha + (-0.453003)*sailStates.beta + (7.185167)*sailStates.p + (-126.149185)*sailStates.q + (4.444089)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.534883)*sailStates.alpha + (0.018102)*sailStates.beta + (1.194600)*sailStates.p + (-5.100756)*sailStates.q + (0.005416)*sailStates.r + (-0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end