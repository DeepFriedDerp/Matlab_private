function [aeroForces] = paramSpace_2_2_1_3_2_3_1(sailStates,airStates)

	CL = (4.153210)*sailStates.alpha + (0.018432)*sailStates.beta + (-2.289073)*sailStates.p + (32.104477)*sailStates.q + (0.340703)*sailStates.r + (0.010716)*sailStates.de;
	CD = -0.124150;
	CY = (-0.031897)*sailStates.alpha + (-0.024946)*sailStates.beta + (0.220921)*sailStates.p + (-0.065300)*sailStates.q + (0.014487)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.181160)*sailStates.alpha + (-0.099878)*sailStates.beta + (-1.006222)*sailStates.p + (7.810828)*sailStates.q + (0.373024)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.846061)*sailStates.alpha + (-0.051861)*sailStates.beta + (8.028124)*sailStates.p + (-130.047943)*sailStates.q + (-1.123703)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.264124)*sailStates.alpha + (-0.007557)*sailStates.beta + (-0.566292)*sailStates.p + (2.926456)*sailStates.q + (-0.008597)*sailStates.r + (0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end