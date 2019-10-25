function [aeroForces] = paramSpace_2_2_2_1_2_1_3(sailStates,airStates)

	CL = (6.157808)*sailStates.alpha + (-0.205463)*sailStates.beta + (-3.509172)*sailStates.p + (44.804432)*sailStates.q + (-2.676811)*sailStates.r + (0.012029)*sailStates.de;
	CD = -2.369440;
	CY = (-0.400007)*sailStates.alpha + (-0.025063)*sailStates.beta + (-1.169093)*sailStates.p + (0.221996)*sailStates.q + (-0.076634)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (2.059105)*sailStates.alpha + (0.515332)*sailStates.beta + (-1.965336)*sailStates.p + (17.397409)*sailStates.q + (-2.416000)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-12.612410)*sailStates.alpha + (0.805117)*sailStates.beta + (11.214432)*sailStates.p + (-161.490479)*sailStates.q + (9.080730)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (1.475964)*sailStates.alpha + (0.038687)*sailStates.beta + (2.495852)*sailStates.p + (-10.995580)*sailStates.q + (0.013625)*sailStates.r + (-0.000308)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end