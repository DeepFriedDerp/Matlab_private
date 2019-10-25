function [aeroForces] = paramSpace_2_4_4_3_2_1_1(sailStates,airStates)

	CL = (4.212836)*sailStates.alpha + (0.184345)*sailStates.beta + (-2.304251)*sailStates.p + (33.350765)*sailStates.q + (-0.936860)*sailStates.r + (0.010952)*sailStates.de;
	CD = -0.173210;
	CY = (0.029643)*sailStates.alpha + (-0.024835)*sailStates.beta + (-0.350626)*sailStates.p + (-0.065299)*sailStates.q + (-0.022988)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.088573)*sailStates.alpha + (0.236223)*sailStates.beta + (-0.942963)*sailStates.p + (7.340180)*sailStates.q + (-0.771087)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.200250)*sailStates.alpha + (-0.628439)*sailStates.beta + (7.680956)*sailStates.p + (-129.003830)*sailStates.q + (3.147667)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.265258)*sailStates.alpha + (0.010918)*sailStates.beta + (0.756071)*sailStates.p + (-3.380847)*sailStates.q + (0.002829)*sailStates.r + (-0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end