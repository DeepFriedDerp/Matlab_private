function [aeroForces] = paramSpace_1_1_1_1_1_2_1(sailStates,airStates)

	CL = (3.590655)*sailStates.alpha + (-0.095780)*sailStates.beta + (-1.669510)*sailStates.p + (27.573849)*sailStates.q + (-0.148428)*sailStates.r + (0.010123)*sailStates.de;
	CD = 0.039650;
	CY = (-0.323741)*sailStates.alpha + (-0.018576)*sailStates.beta + (0.144662)*sailStates.p + (-2.260755)*sailStates.q + (0.025723)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (0.680837)*sailStates.alpha + (0.017145)*sailStates.beta + (-0.531214)*sailStates.p + (3.546961)*sailStates.q + (-0.035398)*sailStates.r + (-0.000571)*sailStates.de;
	Cm = (-13.243943)*sailStates.alpha + (0.438142)*sailStates.beta + (5.960610)*sailStates.p + (-112.748634)*sailStates.q + (0.581197)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (0.491835)*sailStates.alpha + (-0.004900)*sailStates.beta + (-0.337038)*sailStates.p + (3.419257)*sailStates.q + (-0.049679)*sailStates.r + (0.000671)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end