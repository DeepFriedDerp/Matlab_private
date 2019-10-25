function [aeroForces] = paramSpace_1_4_2_1_2_3_1(sailStates,airStates)

	CL = (5.364718)*sailStates.alpha + (-0.355943)*sailStates.beta + (-1.438861)*sailStates.p + (19.840595)*sailStates.q + (1.612664)*sailStates.r + (0.008512)*sailStates.de;
	CD = -2.050220;
	CY = (-0.413316)*sailStates.alpha + (-0.026962)*sailStates.beta + (0.910185)*sailStates.p + (-0.662189)*sailStates.q + (0.181071)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (0.897351)*sailStates.alpha + (-0.543220)*sailStates.beta + (-0.353592)*sailStates.p + (0.407325)*sailStates.q + (1.695171)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-16.057545)*sailStates.alpha + (1.356377)*sailStates.beta + (6.825735)*sailStates.p + (-109.940704)*sailStates.q + (-5.234094)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (2.016398)*sailStates.alpha + (-0.072978)*sailStates.beta + (-2.102453)*sailStates.p + (9.902434)*sailStates.q + (-0.067051)*sailStates.r + (0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end