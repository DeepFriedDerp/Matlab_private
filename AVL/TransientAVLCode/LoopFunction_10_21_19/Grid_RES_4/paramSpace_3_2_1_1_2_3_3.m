function [aeroForces] = paramSpace_3_2_1_1_2_3_3(sailStates,airStates)

	CL = (6.120409)*sailStates.alpha + (0.190528)*sailStates.beta + (-3.509843)*sailStates.p + (44.770767)*sailStates.q + (2.656323)*sailStates.r + (0.012092)*sailStates.de;
	CD = -2.312440;
	CY = (0.388834)*sailStates.alpha + (-0.025032)*sailStates.beta + (1.138677)*sailStates.p + (-0.221995)*sailStates.q + (-0.074609)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (2.058182)*sailStates.alpha + (-0.501390)*sailStates.beta + (-1.965639)*sailStates.p + (17.395916)*sailStates.q + (2.366457)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-12.749757)*sailStates.alpha + (-0.711728)*sailStates.beta + (11.222212)*sailStates.p + (-161.490479)*sailStates.q + (-8.962024)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.438172)*sailStates.alpha + (0.037580)*sailStates.beta + (-2.450926)*sailStates.p + (10.972829)*sailStates.q + (0.013749)*sailStates.r + (0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end