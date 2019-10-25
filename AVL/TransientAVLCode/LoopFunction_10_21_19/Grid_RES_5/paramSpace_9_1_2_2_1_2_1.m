function [aeroForces] = paramSpace_9_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.291088)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.367570)*sailStates.p + (33.592422)*sailStates.q + (0.802550)*sailStates.r + (0.011074)*sailStates.de;
	CD = -0.151400;
	CY = (-0.079031)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.348779)*sailStates.p + (-0.381223)*sailStates.q + (-0.012166)*sailStates.r + (-0.000082)*sailStates.de;

	Cl = (1.253898)*sailStates.alpha + (-0.158957)*sailStates.beta + (-1.038957)*sailStates.p + (8.257313)*sailStates.q + (0.687769)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.748651)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.011159)*sailStates.p + (-131.546402)*sailStates.q + (-2.711806)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (0.269284)*sailStates.alpha + (0.005551)*sailStates.beta + (-0.745702)*sailStates.p + (3.622189)*sailStates.q + (0.003247)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end