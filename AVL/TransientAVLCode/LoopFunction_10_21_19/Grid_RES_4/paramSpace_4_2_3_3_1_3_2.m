function [aeroForces] = paramSpace_4_2_3_3_1_3_2(sailStates,airStates)

	CL = (4.320727)*sailStates.alpha + (0.129387)*sailStates.beta + (-2.515261)*sailStates.p + (37.716305)*sailStates.q + (1.777323)*sailStates.r + (0.011050)*sailStates.de;
	CD = -0.250650;
	CY = (-0.066408)*sailStates.alpha + (-0.025514)*sailStates.beta + (0.609766)*sailStates.p + (-0.489619)*sailStates.q + (-0.121308)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.447941)*sailStates.alpha + (-0.246398)*sailStates.beta + (-1.185477)*sailStates.p + (10.746895)*sailStates.q + (1.408409)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-12.835823)*sailStates.alpha + (-0.484985)*sailStates.beta + (7.566591)*sailStates.p + (-134.148560)*sailStates.q + (-5.917053)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.048306)*sailStates.alpha + (0.057377)*sailStates.beta + (-1.169893)*sailStates.p + (4.852695)*sailStates.q + (-0.000550)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end