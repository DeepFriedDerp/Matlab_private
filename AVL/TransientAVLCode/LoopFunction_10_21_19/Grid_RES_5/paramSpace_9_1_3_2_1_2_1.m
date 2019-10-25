function [aeroForces] = paramSpace_9_1_3_2_1_2_1(sailStates,airStates)

	CL = (4.291265)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.367449)*sailStates.p + (33.601265)*sailStates.q + (0.810996)*sailStates.r + (0.011058)*sailStates.de;
	CD = -0.156340;
	CY = (-0.080359)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.363752)*sailStates.p + (-0.381224)*sailStates.q + (-0.012716)*sailStates.r + (-0.000082)*sailStates.de;

	Cl = (1.256142)*sailStates.alpha + (-0.166444)*sailStates.beta + (-1.038896)*sailStates.p + (8.257722)*sailStates.q + (0.711608)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.713927)*sailStates.alpha + (0.000000)*sailStates.beta + (8.009460)*sailStates.p + (-131.546402)*sailStates.q + (-2.760450)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (0.272017)*sailStates.alpha + (0.005812)*sailStates.beta + (-0.767780)*sailStates.p + (3.633868)*sailStates.q + (0.003211)*sailStates.r + (0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end