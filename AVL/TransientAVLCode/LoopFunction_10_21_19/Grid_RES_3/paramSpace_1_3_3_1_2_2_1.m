function [aeroForces] = paramSpace_1_3_3_1_2_2_1(sailStates,airStates)

	CL = (3.627206)*sailStates.alpha + (0.100560)*sailStates.beta + (-1.626569)*sailStates.p + (27.705385)*sailStates.q + (-0.559072)*sailStates.r + (0.010321)*sailStates.de;
	CD = 0.039380;
	CY = (-0.041584)*sailStates.alpha + (-0.026170)*sailStates.beta + (-0.083898)*sailStates.p + (-0.589407)*sailStates.q + (-0.014849)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.484956)*sailStates.alpha + (0.088976)*sailStates.beta + (-0.419780)*sailStates.p + (2.558244)*sailStates.q + (-0.312379)*sailStates.r + (-0.000892)*sailStates.de;
	Cm = (-13.100028)*sailStates.alpha + (-0.304707)*sailStates.beta + (5.470397)*sailStates.p + (-110.634644)*sailStates.q + (1.871884)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-0.112866)*sailStates.alpha + (0.012484)*sailStates.beta + (0.179780)*sailStates.p + (-0.528260)*sailStates.q + (-0.010466)*sailStates.r + (0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end