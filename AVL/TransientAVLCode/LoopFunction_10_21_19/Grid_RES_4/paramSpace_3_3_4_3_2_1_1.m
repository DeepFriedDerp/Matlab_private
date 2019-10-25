function [aeroForces] = paramSpace_3_3_4_3_2_1_1(sailStates,airStates)

	CL = (4.153210)*sailStates.alpha + (0.018432)*sailStates.beta + (-2.289073)*sailStates.p + (32.104477)*sailStates.q + (-0.340703)*sailStates.r + (0.010716)*sailStates.de;
	CD = -0.124150;
	CY = (0.031897)*sailStates.alpha + (-0.025006)*sailStates.beta + (-0.220921)*sailStates.p + (0.065300)*sailStates.q + (0.014487)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.126775)*sailStates.alpha + (0.115746)*sailStates.beta + (-0.973576)*sailStates.p + (7.406953)*sailStates.q + (-0.375207)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.846061)*sailStates.alpha + (-0.051861)*sailStates.beta + (8.028124)*sailStates.p + (-130.047943)*sailStates.q + (1.123703)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (-0.270006)*sailStates.alpha + (-0.006576)*sailStates.beta + (0.564152)*sailStates.p + (-2.899985)*sailStates.q + (-0.008454)*sailStates.r + (-0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end