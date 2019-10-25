function [aeroForces] = paramSpace_2_4_1_3_2_2_1(sailStates,airStates)

	CL = (3.946504)*sailStates.alpha + (0.096314)*sailStates.beta + (-2.286566)*sailStates.p + (32.619026)*sailStates.q + (-0.309203)*sailStates.r + (0.010707)*sailStates.de;
	CD = 0.043040;
	CY = (0.001261)*sailStates.alpha + (-0.024876)*sailStates.beta + (-0.086662)*sailStates.p + (-0.065300)*sailStates.q + (-0.005673)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.019999)*sailStates.alpha + (0.063410)*sailStates.beta + (-0.937248)*sailStates.p + (7.136284)*sailStates.q + (-0.231110)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.309546)*sailStates.alpha + (-0.438208)*sailStates.beta + (7.816553)*sailStates.p + (-129.003830)*sailStates.q + (1.078854)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.005547)*sailStates.alpha + (0.003311)*sailStates.beta + (0.129281)*sailStates.p + (-0.269995)*sailStates.q + (-0.002927)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end