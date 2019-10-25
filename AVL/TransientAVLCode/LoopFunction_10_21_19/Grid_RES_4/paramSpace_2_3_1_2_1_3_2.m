function [aeroForces] = paramSpace_2_3_1_2_1_3_2(sailStates,airStates)

	CL = (4.622488)*sailStates.alpha + (-0.053922)*sailStates.beta + (-2.547709)*sailStates.p + (33.743736)*sailStates.q + (0.863534)*sailStates.r + (0.010753)*sailStates.de;
	CD = -0.501300;
	CY = (-0.092996)*sailStates.alpha + (-0.025332)*sailStates.beta + (0.503162)*sailStates.p + (-0.769435)*sailStates.q + (0.033060)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.492293)*sailStates.alpha + (-0.239219)*sailStates.beta + (-1.188024)*sailStates.p + (9.253513)*sailStates.q + (0.844806)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-15.384503)*sailStates.alpha + (0.186966)*sailStates.beta + (9.064168)*sailStates.p + (-137.556381)*sailStates.q + (-2.885028)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (0.369164)*sailStates.alpha + (-0.013248)*sailStates.beta + (-1.190106)*sailStates.p + (6.329545)*sailStates.q + (-0.017879)*sailStates.r + (0.000339)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end