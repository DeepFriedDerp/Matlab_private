function [aeroForces] = paramSpace_3_1_4_3_2_2_1(sailStates,airStates)

	CL = (3.946504)*sailStates.alpha + (0.096314)*sailStates.beta + (-2.286566)*sailStates.p + (32.619026)*sailStates.q + (0.309203)*sailStates.r + (0.010707)*sailStates.de;
	CD = 0.043040;
	CY = (-0.001261)*sailStates.alpha + (-0.024696)*sailStates.beta + (0.086662)*sailStates.p + (0.065300)*sailStates.q + (-0.005673)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.178964)*sailStates.alpha + (-0.026071)*sailStates.beta + (-1.034936)*sailStates.p + (8.344846)*sailStates.q + (0.237641)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.309546)*sailStates.alpha + (-0.438208)*sailStates.beta + (7.816553)*sailStates.p + (-129.003830)*sailStates.q + (-1.078855)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.016924)*sailStates.alpha + (0.002554)*sailStates.beta + (-0.122878)*sailStates.p + (0.190782)*sailStates.q + (-0.003355)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end