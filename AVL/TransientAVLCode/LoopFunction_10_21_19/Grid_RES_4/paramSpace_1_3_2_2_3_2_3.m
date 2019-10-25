function [aeroForces] = paramSpace_1_3_2_2_3_2_3(sailStates,airStates)

	CL = (3.903292)*sailStates.alpha + (0.088420)*sailStates.beta + (-2.844865)*sailStates.p + (38.733765)*sailStates.q + (-1.340416)*sailStates.r + (0.010783)*sailStates.de;
	CD = 0.047620;
	CY = (0.069861)*sailStates.alpha + (-0.023815)*sailStates.beta + (-0.396969)*sailStates.p + (1.057312)*sailStates.q + (-0.079000)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.410223)*sailStates.alpha + (0.186750)*sailStates.beta + (-1.451260)*sailStates.p + (12.811629)*sailStates.q + (-0.972652)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-13.464502)*sailStates.alpha + (-0.323617)*sailStates.beta + (9.158506)*sailStates.p + (-144.624466)*sailStates.q + (4.483710)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.212724)*sailStates.alpha + (0.031145)*sailStates.beta + (0.612656)*sailStates.p + (-2.525497)*sailStates.q + (-0.014158)*sailStates.r + (-0.000349)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end