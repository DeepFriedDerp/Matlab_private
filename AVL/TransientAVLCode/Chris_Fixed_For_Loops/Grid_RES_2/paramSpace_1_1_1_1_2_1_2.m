function [aeroForces] = paramSpace_1_1_1_1_2_1_2(sailStates,airStates)

	CL = (2.043131)*sailStates.alpha + (0.154870)*sailStates.beta + (-5.037829)*sailStates.p + (52.235077)*sailStates.q + (0.290672)*sailStates.r + (0.011287)*sailStates.de;
	CD = -1.103890;
	CY = (0.674903)*sailStates.alpha + (-0.030195)*sailStates.beta + (0.357717)*sailStates.p + (2.312277)*sailStates.q + (0.046931)*sailStates.r + (0.000515)*sailStates.de;

	Cl = (0.134632)*sailStates.alpha + (-0.274979)*sailStates.beta + (-3.348668)*sailStates.p + (29.537994)*sailStates.q + (0.521794)*sailStates.r + (0.004057)*sailStates.de;
	Cm = (-4.643597)*sailStates.alpha + (-0.648320)*sailStates.beta + (17.795977)*sailStates.p + (-207.464264)*sailStates.q + (-0.943269)*sailStates.r + (-0.077232)*sailStates.de;
	Cn = (-2.146333)*sailStates.alpha + (-0.041816)*sailStates.beta + (-1.312699)*sailStates.p + (6.179050)*sailStates.q + (-0.045920)*sailStates.r + (-0.000488)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end