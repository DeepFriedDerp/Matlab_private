function [aeroForces] = paramSpace_4_4_1_2_1_1_3(sailStates,airStates)

	CL = (4.016767)*sailStates.alpha + (0.015744)*sailStates.beta + (-2.750402)*sailStates.p + (34.765633)*sailStates.q + (0.292172)*sailStates.r + (0.010084)*sailStates.de;
	CD = -0.235110;
	CY = (-0.144307)*sailStates.alpha + (-0.021751)*sailStates.beta + (-0.102327)*sailStates.p + (-1.057314)*sailStates.q + (0.020468)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.225533)*sailStates.alpha + (0.071860)*sailStates.beta + (-1.387337)*sailStates.p + (11.385293)*sailStates.q + (-0.034614)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-14.627729)*sailStates.alpha + (-0.210270)*sailStates.beta + (9.785781)*sailStates.p + (-143.598221)*sailStates.q + (-0.992325)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.060905)*sailStates.alpha + (-0.013621)*sailStates.beta + (0.493391)*sailStates.p + (-2.204547)*sailStates.q + (-0.036877)*sailStates.r + (0.000275)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end